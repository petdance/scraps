I'm in love with List::UtilsBy.  It's one of those "Why didn't
someone do this earlier?" modules (or maybe it's "Why didn't I know
about it earlier?").

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

Now, with List::UtilsBy, you can do this:

    my %n = count_by { substr($_->name,0,1) } @users;

How about getting the user with the highest salary?

    my $max_user;
    my $max_salary = 0;
    for my $i ( @users ) {
        if ( (my $val = $i->salary) > $max_val ) {
            $max_user = $i;
            $max_val = $val;
        }
    }

    # $max_user is now the user with the highest salary.

Or you can just do this:

    my $max_user = max_by { $_->salary } @users;

# Performance

In some cases, List::UtilsBy is faster, and sometimes slower.  For
sorting, `sort_by` should be faster because it evaluates the key
exactly once.
