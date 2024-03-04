#!/usr/bin/perl -w

use strict;

use FindBin;
use lib "$FindBin::Bin/../../../perl_lib";

use EPrints;

$|=1;

if( scalar( @ARGV ) != 1 )
{
        print "\nUsage is:";
        print "\n\topenoffice-local.pl {start,stop}\n";
        exit(1);
}

my @repoids = EPrints::Config::get_repository_ids();
my $session;
if ( scalar @repoids > 0 )
{
	$session = new EPrints::Session( 1, $repoids[0] ) or die( "No archive '$ARGV[0]'" );
}
else
{
	die( "No archives yet created for this repository." );
}

my $cmd = $ARGV[0];

die( "Wrong command 'ARGV[0]'" ) unless( defined $cmd && $cmd =~ /^(start|stop)$/ );

my $plugin = $session->plugin( 'OpenOffice' ) or die( 'no Plugin::OpenOffice plugin found' ); 

if( $cmd eq 'start' )
{
	if( $plugin->start() )
	{
		print "OpenOffice started\n";
	}
	else
	{
		print "Failed to start OpenOffice\n";
	}
}
elsif( $cmd eq 'stop' )
{
	if( $plugin->stop() )
	{
		print "OpenOffice stopped\n";
	}
	else
	{
		print "Failed to stop OpenOffice\n";
	}
}

$session->terminate;
exit;
