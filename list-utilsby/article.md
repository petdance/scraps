I'm in love with List::UtilsBy.  It's one of those "Why didn't
someone do this earlier?" modules (or maybe it's "Why didn't I know
about it earlier?").

# Convenience

I've always been annoyed at having to repeat the field name in a `sort` sub:

    my @sorted = sort { $a->name cmp $b->name } @users;

Now it's just this:

    my @sorted = sort_by { $_->name } @users;

I can't imagine how many times I've written something like this:

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
    for my $i ( @users ) {
        if ( (my $val = $i->salary) > $max_salary ) {
            $highest_paid = $i;
            $max_salary = $val;
        }
    }

Or I can just do this:

    my $highest_paid = max_by { $_->salary } @users;

# Performance

For most of the functions I've tried, List::UtilsBy is slower than the
hand-written loop.  For sorting, `sort_by` has been faster because it
evaluates the key exactly once.  However, it wasn't as fast as an inline
Schwartzian transform.

I used Benchmark to run a test of 100 sorts of 10000 input records.

    timethese( 100, {
        # Key comes from a hash lookup.
        lookup_raw_____ => sub { @x = sort { $a->{name} cmp $b->{name} } @input },
        lookup_schwartz => sub { @x = sort_by { $_->{name} } @input },
        lookup_utilsby_ => sub { @x = map { $_->[0] } sort { $a->[1] cmp $b->[1] } map { [$_, $_->{name}] } @input },

        # Key comes from a method call.
        method_raw_____ => sub { @x = sort { $a->name cmp $b->name } @input },
        method_schwartz => sub { @x = sort_by { $_->name } @input },
        method_utilsby_ => sub { @x = map { $_->[0] } sort { $a->[1] cmp $b->[1] } map { [$_, $_->name] } @input },
    } );

Giving these results:

    # Key comes from a hash lookup.
    lookup_raw_____:  3 wallclock secs @ 31.95/s
    lookup_schwartz:  3 wallclock secs @ 34.01/s
    lookup_utilsby_:  4 wallclock secs @ 28.17/s

    # Key comes from a method call.
    method_raw_____: 11 wallclock secs @  9.12/s
    method_schwartz:  3 wallclock secs @ 31.45/s
    method_utilsby_:  4 wallclock secs @ 25.06/s

In most cases, I'm more than happy to burn a few milliseconds in the
name of simplicity and reduced amount of code.

Thanks to Paul Evans for putting this together.  And thanks to Dave
Rolsky for putting out List::AllUtils which brings together List::Util,
List::MoreUtils and List::UtilsBy under one handy umbrella.
