# AZ-300

Alex Ivanov

aivanov@microsoft.com

aka.ms/203Teams
aka.ms/300slides
aka.ms/300labs

Azure Monitor Keeps logs for only 30 days You can query the logs in a
SQL-like language.

The alerts functionality is going to probably obviate our Nagios
monitoring.  Then again, each alert costs real money, so maybe not.

The monitoring intercepts HTTP requests and can monitor for you.  So if
you've got Tomcat running, alerts will tell if Tomcat returns a 404,
without Tomcat doing the logging.

Network Watcher has to be set up on a per-datacenter basis.

EA Subscription = Enterprise Agreement

RBAC = Role-based access control

We will probably want to look at the app firewall, which will route based
on paths.  Also blocks known bad IP/FQDN.

Immutable infrastructure -- Don't modify infrastructure after it's deployed
to production.
