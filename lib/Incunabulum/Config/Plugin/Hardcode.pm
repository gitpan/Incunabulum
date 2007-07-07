package Incunabulum::Config::Plugin::Hardcode;
#Id#
use strict;
use warnings FATAL => 'all';

use Incunabulum::Config;

our $VERSION = '0.01';

sub get_config_data_order {1};

sub get_config_data
{
	my $pkg = shift;
	my $config = {};
	$$config{'incunabulum'}{'model'}{'plugin'}{'pg'}{'dbname'} = q#dbname#;
	$$config{'incunabulum'}{'model'}{'plugin'}{'pg'}{'dbuser'} = q#dbuser#;
	$$config{'incunabulum'}{'model'}{'plugin'}{'pg'}{'dbpass'} = q#dbpass#;
	$$config{'incunabulum'}{'model'}{'plugin'}{'pg'}{'dbhost'} = q#dbhost#;
	$$config{'incunabulum'}{'model'}{'plugin'}{'pg'}{'dbport'} = q#dbport#;
	Incunabulum::Config::write_config($config);
}

1;
