# Perl Platform-as-a-Service Shootout

Mark Allen

https://github.com/mrallen1/perl-PaaS-Shootout

https://speakerdeck.com/u/mrallen1/p/perl-platform-as-a-service-shootout

Coders don't have to be sysadmins
* Deploy yoru code
* Magic happens
* Your app is ive
* Web applications
* Queue workers, too

# Test app: geotz

Given a JSON encoded list of IP addresses, return UTC offset for each IP's timezone

Four different test programs

* Perl: Dancer &amp; Mojolicious
* Python: Flask
* Erlang: Webmachine

Dependencies:
* Try::Tiny
* Regexp::Common
* DateTime + DateTime::TimeZone
* Geo::IP (hard to automate)

Providers
* Heroku
* dotCloud
* Stackato
* OpenShift (Red Hat)
* flexflux.com (closing)
* Juju

Criteria
* Ease of deployment
* Performance (ignored)
* Cost (ignored)
* How "magical" the Perl support is (first class or hacked together)

Findings
* Getting PSGI-compliant apps into PaaS is general pain free
* Ptyhon is less painful
