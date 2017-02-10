I'm in love with List::UtilsBy.  It's one of those "Why didn't someone
do this earlier?" modules (or maybe it's "Why didn't I know about it
earlier?").  It replicates much of the functionality of List::Util and
lets them operate on arbitrary blocks.

# Convenience

I've always been annoyed at having to repeat the field name in a
`sort` sub:

    my @sorted = sort { $a->name cmp $b->name } @users;

Now it's just this:

    my @sorted = sort_by { $_->name } @users;

I can't imagine how many times I've written something like this to build
a hash of the counts of something based on a list:

    # Tally up a list of first letters of everyone's name.
    my %n;
    for my $i ( @users ) {
        ++$n{ substr($i->name,0,1) };
    }

Now, with List::UtilsBy, I can do this:

    my %n = count_by { substr($_->name,0,1) } @users;

How about getting the user with the highest salary?

    my $highest_paid;
    my $max_salary = 0;
    for my $user ( @users ) {
        if ( (my $val = $user->salary) > $max_salary ) {
            $highest_paid = $user;
            $max_salary = $val;
        }
    }
    say $highest_paid->name, ' is the highest paid.';

Or I can just do this:

    my $highest_paid = max_by { $_->salary } @users;

# Performance

For most of the functions I've tried, List::UtilsBy is slower than
the hand-written loop.  However, for sorting `sort_by` has been faster
because it evaluates the key exactly once for each element of the loop.
It was even faster than rolling my own Schwartzian transform.  For complex
key methods, the time savings will be dramatic.

I used Benchmark to run a test of 1000 sorts of 5000 input records.

    timethese( 1000, {
        # Key comes from a hash lookup.
        lookup_raw_____ => sub { @x = sort { $a->{name} cmp $b->{name} } @input },
        lookup_schwartz => sub { @x = map { $_->[0] } sort { $a->[1] cmp $b->[1] } map { [$_, $_->{name}] } @input },
        lookup_utilsby_ => sub { @x = sort_by { $_->{name} } @input },

        # Key comes from a method call.
        method_raw_____ => sub { @x = sort { $a->name cmp $b->name } @input },
        method_schwartz => sub { @x = map { $_->[0] } sort { $a->[1] cmp $b->[1] } map { [$_, $_->name] } @input },
        method_utilsby_ => sub { @x = sort_by { $_->name } @input },
    } );

Giving these results:

    # Key comes from a hash lookup.
    lookup_raw_____: 14 wallclock secs @ 72.52/s
    lookup_schwartz: 19 wallclock secs @ 53.28/s
    lookup_utilsby_: 15 wallclock secs @ 64.47/s

    # Key comes from a method call.
    method_raw_____: 54 wallclock secs @ 18.64/s
    method_schwartz: 22 wallclock secs @ 45.64/s
    method_utilsby_: 17 wallclock secs @ 59.59/s

In most cases, I'm more than happy to burn a few milliseconds in the
name of simplicity and reduced amount of code.

Thanks to Paul Evans for putting this together.  And thanks to Dave
Rolsky for putting out List::AllUtils which brings together List::Util,
List::MoreUtils and List::UtilsBy under one handy umbrella.
