# Doing things wrong

chromatic

Constraints make great art.

Batch apps: Object design

    $ bin/trendshare updatedaily buildsite publishsite

It's a functional interface to the program.

Using `waitpid()` + `curl` instead of LWP::Parallel.

# Screen scraping

* Obvious: HTML::TokeParser::Simple or Mojo::DOM
* Common: Regexes
* Lovely: Template::Extract

# Database updates

Instead of transactional stuff, generate SQL and then batch load
it.  chromatic does what I do on Solr updates.
