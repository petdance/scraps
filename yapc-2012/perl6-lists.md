# Perl 6 lists

Patrick Michaud

* Current Synopses on Lists are very out of date
* Lists are mutable sequenvces of objects
* Lists can be infinite
* Arrays are Lists of scalar containers
* List assignment is "eager"
* Slurpy (\*@args) and Lol(\*\*@args) parameters and flattening


Parcels
* represent syntactic groups of objects
* Comma constructs a parcel and not the parens

    ($xyz)   # not a Parcel
    ($xyz,2) # A Parcel iwth two items
    ($xyz,)  # Parcel with one item
    ()       # An empty Parcel


Most list operations flatten Parcels

    my @a = 2,3;
    my @b = <f g>
    ((1,@a),(4,5,@b)).elems # 7

You can ask a parcel to not flatten.

Basic challenge of iterators
* Write a function like map that processes all elements of a List
* In Rakudo, `for` and `map` are the same thing.
