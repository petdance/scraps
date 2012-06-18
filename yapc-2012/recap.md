# YAPC recap

Here are some notes about YAPC::NA 2012, extracted from my notes.

# ack 2.0

I uploaded [ack 2.00alpha01](http://betterthangrep.com/ack-20/) to the CPAN.

All that week, Rob Hoelz did a ton of work, and Jerry Gay was
invaluable in helping us work through some configuration issues.
Then, out of nowhere, Ryan Olson swoops in to close some sticky
issues in the GitHub queue.  I love conferences for bringing people
to get things done.

Finally, on Thursday night at the Bad Movie BOF I hacked away on
the final few tickets while watching ["Computer Beach Party (1987)"](http://www.mentalfloss.com/blogs/archives/55561).
Halfway through MST3K's take on ["Catalina Caper (1967)"](http://en.wikipedia.org/wiki/Catalina_Caper),
I made the alpha release.  If that's not heaven, I don't know what is.

# Mojolicious

Glen Hinkle

[Mojolicous](http://mojolicio.us/) looks really cool.  Glen
called it a "full web framework, not partial," although I'm not
sure what would count as a partial framework.

It has no outside dependencies, and works to have a lot of bleeding
edge features like websockets, non-blocking events, IPv6 and
concurrent requests.

`Mojo::UserAgent` is the client that is part of Mojolicious, and
it's got all sorts of cool features:

* DOM parsing
* text selection via CSS selectors
    * For example, "give me all the text that is `#introduction ul li`."
    * Command line: `mojo get mojolicio.us '#introduction ul li'`
* JSON parsing
* JSON pointers
    * JSON pointers look like XPath as a way of specifying data in
    a JSON string

Mojolicious is based on "routes", which look like:

    get '/'
    get '/:placeholder'
    get '/#releaxed'
    get '/*wildcard'

The latter three are (apparently) ways of making flexible URL
specifications that then return information to your app about the
URL.

Sample app with Mojolicious::Lite:

    use Mojolicious::Lite;
    get '/' => sub {
        my $self = shift;
        $self->render( text => 'mytemplate' );
    }
    app->start;

    __DATA__
    @@ mytemplate.html.ep
    Hello!

Mojolicious also has its own templating language that looks a lot
like Mason, but Glen said you can use Template Toolkit as well (and
presumably others, but TT was the only one I was interested in.)

Full Mojolicious includes a dev server called Morbo and you can run
your apps through the Hypnotoad "hot-code-reloading production
server" if you don't want to run under Apache/etc.

Another selling point for Mojolicious: They value making things
"beautiful" and "fun".  Glen specifically said "Join our IRC channel.
We will not be mean to you."

# Perl-as-a-Service shootout

Mark Allen

[Slides](https://speakerdeck.com/u/mrallen1/p/perl-platform-as-a-service-shootout)

This was disappointing because I was hoping for recommendations to
use or not use a given vendor's offerings.  I was hoping at least
for "This vendor does this, and that one does that differently,"
but all I came away with was "they're pretty much the same."

It's a good sign that, as Mark put it, "getting PSGI-compliant apps
into PaaS is generally pain free."

His criteria were as follows:

* Ease of deployment
* Performance (ignored)
* Cost (ignored)
* How "magical" the Perl support is (first class or hacked together)

Why ignore performance and cost?  I don't know.

# Big data and PDL

There were three sessions back-to-back about PDL, the Perl Data
Language.  It's in the same space as Mathematica and R.  I was
disappointed because I was hoping for big data analysis outside of
just number crunching.  The analysis of galaxy luminosity was pretty
and looked very easy to do, but it didn't have any application I
was interested in.  I bailed after the 2nd talk.

My big takeaway from the talk was that I need to take a statistics
class.

# Web security 101

Michael Peters gave a good intro talk on security, handwaving the
tech details with examples of "This is how bad guys can get your
info."

Emphasis on not trusting your client data, but I was surprised and
disappointed that he seemed to steer people away from Perl's taint
mode.  He made vague reference to there being bugs with regexes and
taint mode, but I don't know what he's referring to.

Taint mode is one of my favorite things about Perl 5, and there are
(last I checked) no plans for implementing it in Perl 6. :-(

One of the examples Michael used for an example of an attack with
SQL injection used `sleep()` to let the attacker find out information
about the database based on timings.  I asked him to write that up
for [bobby-tables.com](http://bobby-tables.com).

# On being a polyglot

Miyagawa gave a great overview of how he spends time in Perl, Python
and Ruby, and what he learns from each, and what each language
learns from the others.

Key point: **Ruby is not the enemy. They are neighbors.**

Things he likes about Ruby:

* Everything is an object
* More Perlish than Python
* Diversity matters = TIMTOTWTDI
* Meta programming built in and encouraged
* Convention of `!` and `?` in method names
    * `str.upcase!` to upcase `str` in place
    * `str.islower?` to functions that return values
* Ability to omit `self`
* Everything is an expression.
* No need to type `;` (unlike Python)
* Implicit better than explicit
* block, iterators and yield
* No semicolons, 2-space indent.
    * (This last one gives me the creeps. 2-space indent!??!)

Naming differences between the three:

* Perl naming: Descriptive, boring, clones become `::Simple`
* Python naming: Descriptive, confusing, everything is `py*` or `*py`
* Ruby naming: Fancy, creative, chaotic (Sinatra, Rails, etc)
* With frameworks, all the languages get creative: Django, nbottle,
Catalyst, Dancer, Mojolicious

When you're going to borrow something from another language, don't
just borrow it, but copy it wholesale.  Example: Perl's
[WWW::Mechanize][perlmech] getting cloned as Ruby's
[WWW::Mechanize][rubymech].

# Doing Things Wrong, chromatic

chromatic talked about the value of doing things "wrong" and embracing
your constraints.  Sometimes you can't do The Perfect Job, and
that's OK, and sometimes comes out even better.

Example: chromatic wanted to do some parallel web fetching.  He
could have dug into `LWP::Parallel`, but instead he went with what
he knew: `waitpid()` and shelling to `curl`.

Screen scraping example:

* Obvious answer: [HTML::TokeParser::Simple](http://search.cpan.org/dist/HTML-TokeParser-Simple/) or [Mojo::DOM](http://search.cpan.org/dist/Mojolicious/lib/Mojo/DOM.pm)
* Common: Regexes
* Lovely: [Template::Extract](http://search.cpan.org/dist/Template-Extract/)

[Parsing HTML with regex][htmlregex] may be the "wrong" way to do
it, but sometimes, it's the best solution.

# Perl 6 lists

Patrick Michaud talked about all kinds of awesome stuff you can do
with lists and arrays in Perl 6.  After a bit I stopped trying to
take notes and follow what he was saying and instead just let it
wash over me so I could absorb the coolness.

I would really like Perl 6 to be easy enough to install for serious
play.  I need to get my feet back into the Perl 6 pool and see how
I can help.

# Tweakers Anonymous

John Anderson (genehack)

Quick overview of cool things that he has in his configs.

* "The F keys are not just to skip tracks in your music player."
* Keep your configs in git.  You will screw them up.  This will save you.
* Make your editor `chmod +x` when you create a `.pl` file since you know you will want to run it.

The coolest thing was this plugin called `flymake`.  Apparently it
runs continuously, submitting your code to a compiler (or `perl
-c`) as you type.  As soon as John made a typo on a line and moved
to the next line, the error line was highlighted.  He then demonstrated
doing this with `Perl::Critic`, which must be dog slow, but `flymake`
lets you adjust the frequency of checks.

# Exceptional Exceptions

Mark Fowler, now at OmniTI.  Great discussion of exceptions in Perl.

Returning false on failure sucks because you have to follow your
failures all the way up the call tree.  It's tedious and error-prone
because all it takes is one link in the chain to not propagate the
error and you're out of luck.

Using try/catch from Java.

There are three non-deprecated ways of doing exceptions in Perl.

## eval

`eval` is often confused with `eval $string` which means to compile
code.  eval is a statement not a block so requires a semicolon after
it.  It works but it's a pain.

## Try::Tiny

* Simple extension to the syntax
* Uses `$_` not `$@`

## TryCatch

* Has named exception variables
* Fully functional syntax
* Very fast and featureful
* Large dependency base

TryCatch is a little faster than Try::Tiny, but `eval` is much much faster than either of them.

TryCatch has much more clever syntax, but looks (to me) to be more dangerous.

Mark recommends that whatever you use, you make exceptions out of `Exception::Class` objects.

[perlmech]: http://search.cpan.org/dist/WWW-Mechanize
[rubymech]: http://mechanize.rubyforge.org/
[htmlregex]: http://htmlparsing.com/regexes.html
