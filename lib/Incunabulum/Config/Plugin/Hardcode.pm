package Incunabulum::Config::Plugin::Hardcode;
#$Id: Hardcode.pm 24 2007-07-07 21:07:58Z apeiron $
use strict;
use warnings FATAL => 'all';

use Incunabulum::Config;

our $VERSION = '0.02';

sub get_config_data_order {1};

sub get_config_data
{
	my $pkg = shift;
	my $config = shift; # Reference to a reference to a hash.
	$$$config{'incunabulum'}{'model'}{'plugin'}{'pg'}{'dbname'} = q#dbname#;
	$$$config{'incunabulum'}{'model'}{'plugin'}{'pg'}{'dbuser'} = q#dbuser#;
	$$$config{'incunabulum'}{'model'}{'plugin'}{'pg'}{'dbpass'} = q#dbpass#;
	$$$config{'incunabulum'}{'model'}{'plugin'}{'pg'}{'dbhost'} = q#dbhost#;
	$$$config{'incunabulum'}{'model'}{'plugin'}{'pg'}{'dbport'} = q#dbport#;
}

1;
