# Intro to Mojolicious

Glenn Hinkle

http://act.yapcna.org/2012/talk/84

* Full framework, not partial
* No dependencies
* Bleeding adge: websockets, non-blocking events, IPv6, concurrent requests
* Keep it pretty
* Fun

Mojo::UserAgent
* DOM parsing
* CSS selectors
* JSON parsing / JSON pointers
    * JSON pointers look like XPath
* `MOJO_USERAGENT_DEBUG=1` for debugging
* `mojo get mojolicio.us '#introduction ul li'`

Routes
* `get '/'`
* `get '/:placeholder'`
* `get '/#releaxed'`
* `get '/*wildcard'`

# Mojolicious::Lite

    use Mojolicious::Lite;
    get '/' => sub {
        my $self = shift;
        $self->render( text => 'mytemplate' );
    }
    app->start;

    __DATA__
    @@ mytemplate.html.ep
    Hello!

EP templates

    % for (@$foo) {
        ...
    % }

    %= select_field language => [qw/ de en /]

Helpers and plugins are the same, except that helpers are shipped
with Mojo, and plugins are distributed.

# Mojolicious

"Full apps" not "lite apps"

    mojo generate app MyApp

Morbo is dev server

Hypnotoad is hot-code reloading production server

Heroku handles Mojolicious.
