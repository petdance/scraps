# Web Security 101 (for developers)

Michael Peters

Rule 1: You do not control the client
* URLs
* GET/POST parameters
* Cookies
* HTTP headers

Know your tools.  Each language is different and has different
strengths and weaknesses.

Kinds of attacks
* Code injection
* Cross site sscripting (XSS)
* Cross site request forgery (CSRF)
* DOS
* Buffer overflows

Make sure your files are relative to a safe root (not the FS root
or even document root).
