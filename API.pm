package WWW::Goodreads::API;

use strict;
use warnings;

use v5.10;

## Minimal moose compat:
use Moo;
use URI;
use URI::QueryParam;
use LWP::Simple 'get', '$ua';
use XML::Simple ;
use Data::Dumper;
use Business::ISBN;

## for signed requests
use Net::OAuth;

# goodreads api key/secret
has dev_key => (isa => sub { $_[0] =~ /^\w+$/ }, is => 'rw', required => 0);
has dev_secret => (isa => sub { $_[0] =~ /^\w+$/ }, is => 'rw', required => 0);

# oauth access/secret
has oauth_token => (isa => sub { $_[0] =~ /^\w+$/ }, is => 'rw', required => 0);
has oauth_secret => (isa => sub { $_[0] =~ /^\w+$/ }, is => 'rw', required => 0);

my %api_methods = (
    auth_user => { 
        api => 'api/auth_user', 
        http_method => 'GET', 
        protected => 1,
        content_in => 'xml',
    },
    show_user => { 
        http_method => 'GET', 
        protected => 0,
        content_in => 'xml',
    },
);

sub call_method {
    my ($self, $method, $params, $protected, $http_method) = @_;
    ## The api page names methods with foo.bar, the uri is actually foo/bar
    ## but some method names end in .xml.
    ##$method =~ s!\.!\/!g;

    my $content_in = 'plain';
    if(exists $api_methods{$method}) {
        $protected = $api_methods{$method}{protected};
        $http_method = $api_methods{$method}{http_method};
        $content_in = $api_methods{$method}{content_in};

        $method = $api_methods{$method}{api} if(exists $api_methods{$method}{api});
    }

    # FIXME: merge these more elegantly.
    my $response;
    my $goodreads_api_url = URI->new("http://www.goodreads.com");

    if($protected) {
        $response = $self->_call_protected_method($method, $params, $http_method);
    } else {

        $goodreads_api_url->query_form_hash($params)
          if ($params);


#    $goodreads_api_url->query_param(oauth_access_token => $self->oauth_key)
#        if $self->oauth_key;
#    $goodreads_api_url->query_param(oauth_access_token_secret => $self->oauth_secret)
#        if($self->oauth_secret);

        $goodreads_api_url->query_param(key => $self->dev_key) 
          if ($self->dev_key);
    
        ## Method will often consist of multiple path segments.
        $goodreads_api_url->path($method);

        say "Fetching: $goodreads_api_url";

        $response = $ua->get($goodreads_api_url);
    }

    if (!$response->is_success)
    {
        if ($response->content =~ m/<html>/ or 
            $response->content =~ m/not authorized/i
            #$response->content =~ m!<error>book not found</error>!
           )
        {
            # This is probably the website's general 404 response -- we mistyped the API name.
            for my $subresponse ($response->redirects, $response)
            {
                my $subrequest = $subresponse->request;
                print $subrequest->as_string("\n"), "\n--->\n";
                print $subresponse->as_string("\n"), "\n---\n\n";
            }
            die "Failed API call " . $response->status_line . " from url $goodreads_api_url\n";
        }
        
        # This is the specific API deciding that we failed.  Make it produce something that can be nicely handled by an eval {}.
        die $response->content;
        
    }

    my $content = $response->content;

    if ($content_in eq 'xml') {
        $content = XMLin($content);
    }

    return $content;
}

sub _call_protected_method {
    my ($self, $method, $params, $http_method) = @_;

    $http_method ||= 'GET';
    $http_method = uc $http_method;

    my $gr_url = URI->new('http://www.goodreads.com');
    $gr_url->path($method);

#    print STDERR "Calling: $gr_url\n";

    my $oauth_request = Net::OAuth->request('protected resource')->new(
        consumer_key => $self->dev_key,
        consumer_secret => $self->dev_secret,
        request_url => $gr_url->as_string,
        request_method => $http_method,
        signature_method => 'HMAC-SHA1',
        timestamp => time(),
        nonce => rand(),
        token => $self->oauth_token,
        token_secret => $self->oauth_secret,
        extra_params => $params,
       );

    $oauth_request->sign;
#    print STDERR "Calling: ", $oauth_request->request_url, "\n";

    my $response;
    if ($http_method eq 'GET') {
        print "Fetching ".$oauth_request->request_url." (protected GET)\n";
        $response = $ua->get($oauth_request->request_url, #to_url 
                            Authorization => $oauth_request->to_authorization_header );
    } else {
        print "Fetching ".$oauth_request->request_url." (protected POST)\n";
        $response = $ua->post($oauth_request->request_url,
                              $params,
                              Authorization => $oauth_request->to_authorization_header );
    }


    return $response;
}


#####

sub books {
    my ($api, $params) = @_;

    my $method = 'search/index.xml';

    print Dumper($params);
    print "books($api, ".join(' // ', %$params)."\n";

    my $results = {};

    $results = $api->call_method($method, {
        'q' => (($params->{title}||'') . '   ' . ($params->{author}||'')),
    });


    # my $author = delete $params->{author};
    # if($author) {
    #     $results = $self->call_method($method, { 
    #         'search[field]' => 'author', 
    #         'q' => $author,
    #                                      });
    # } else {
    #     $results = $self->call_method($method, { 
    #         'q' => $params->{title},
    #                                      });
    # }

    my $xml = XMLin($results, 
                    ForceArray => ['work'],
                    KeyAttr => [],
        );
#    print Dumper($xml);
    my $works = $xml->{search}{results}{work};

    #print "Found: ", Dumper($works);
    my @books = grep { $_->{best_book}{title} =~ /\Q$params->{title}\E/i
                       and $_->{best_book}{author}{name} =~ /\Q$params->{author}\E/ } @$works;
    #print "Filtered: ", Dumper(\@books);

    return \@books;
    
}

=item book_isbn_to_id

  my $bookid = $api->book_isbn_to_id($isbn);

L<http://www.goodreads.com/api#book.isbn_to_id>

=cut

sub book_isbn_to_id {
    my ($api, $isbn) = @_;
    # as_isbn10: Finds 4/6.
    # as_isbn13: Finds 4/6.
    print "book_isbn_to_id($isbn)\n";
    $isbn = Business::ISBN->new($isbn)->as_isbn13->as_string([]);
    my $res;
    eval {
        $res = $api->call_method('book/isbn_to_id', {isbn => $isbn});
    };
    if ($@ =~ m/No book with that ISBN/) {
        return undef;
    } elsif ($@) {
        # Rethrow
        die;
    }
    return $res;
}

=head1 user_status

  $api->user_status(%params);

L<http://www.goodreads.com/api#user_status.create>

=cut

sub user_status {
    my ($api, %params) = @_;

    # FIXME: this should be more flexable about which params the user wants to enter.
    $api->call_method('user_status.xml', 
                      {
                          'user_status[book_id]' => $params{book_id},
                          'user_status[page]' => $params{page}
                      }, 1, 'POST');
}

=head2 show_user

  $api->show_user(id => 42);
  $api->show_user(username => 'yourmother');

L<http://www.goodreads.com/api#user.show>

=cut

sub show_user {
    my ($api, %params) = @_;

    my $xml = $api->call_method('user/show/' . ($params{id}||$params{username}) . '.xml', {}, 1); 

    return XMLin($xml);
}

sub get_updates {
    my ($api, %params) = @_;

    my $user_data = $api->show_user(%params);
    my $updates = $user_data->{user}{updates}{update};

    my $book_pages = {};
    for my $update (@$updates) {
        #print Dumper($update);
        # This also includes "review", and presumably some other junk for things like friends.
        # (Review seems to be an update with no page, including adding it to a shelf.)
        next unless $update->{type} eq 'userstatus';

        # FIXME: Make it less fragile to make sure that we only count the most recent update on a given book ... or the one with the highest page number?
        # Current behavior relies on goodreads giving the most recent one at the top.
        $book_pages->{$update->{object}{user_status}{book}{id}{content}} ||= $update->{object}{user_status}{page}{content};
    }

    return $book_pages;
}

=head1 add_to_shelf

 $api->add_to_shelf(book_id => 27, name => 'bobthebuilder');

L<http://www.goodreads.com/api#shelves.add_to_shelf>

=cut

sub add_to_shelf {
    my ($api, %params) = @_;

    $api->call_method('shelf/add_to_shelf.xml',
                      {
                          book_id => $params{book_id},
                          name => $params{name},
                      }, 1, 'POST');
}

=head1 auth_user

Fetch data about the currently logged in user, most basic protected method.

L<http://www.goodreads.com/api#auth.user>

=cut

sub auth_user {
    my ($api) = @_;

    $api->call_method('auth_user');
}

=head1 book_show

Show current data about a particular book

L<http://www.goodreads.com/api#book.show>

=cut

sub book_show {
    my ($api, %params) = @_;

    my $book = $api->call_method('book/show/' . $params{book_id} . '.xml', {}, 1);
    return XMLin($book);
}

sub get_book_page {
    my ($api, %params) = @_;

    my $book = $api->book_show(%params);

    if(exists $book->{book}{my_review}) {
        return $book->{book}{my_review}{user_statuses}{user_status}{page}{content};
    } 

    return 0;
}

sub find_goodreads_book {
    my ($api, %params) = @_;
    ## find it by isbn, or resort to searching on title/author

    my $bookid;
    if(defined $params{isbn}) {
        $bookid = $api->book_isbn_to_id($params{isbn});
    }
    if(!$bookid) {
        my $books = $api->books({ 
            author => $params{author},
            title => $params{title},
        });
#        print Dumper($books);
        if(@$books ==1) {
            $bookid = $books->[0]{best_book}{id}{content};
        }
    }

    return $bookid;
}

'done coding';
