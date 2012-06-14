# Exceptional Exceptions

Mark Fowler, now at OmniTI

Returning false on failure sucks.

* It's tedious.
* It's uninformative.
    * Out of band details of the failure
* It's rageful.
    * Checking state all the way to the top of the stack sucks.


Using try/catch from Java.

There are three non-deprecated ways of doing exceptions in Perl.

Eval (there is no try)

`eval` is often confused with `eval $string` which means to compile code.

eval is a statement not a block so requires a semicolon after it

Try::Tiny
* Simple extension to the syntax
* Uses `$_` not `$@`

TryCatch
* Has named exception variables
* Fully functional syntax
* Very fast and featureful
* Large dependency base

Benchmarks
* eval is much much faster than Try::Tiny, but TryCatch is a little faster than Try::Tiny

TryCatch has much more clever syntax, but looks dangerouser
