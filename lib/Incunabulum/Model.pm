package Incunabulum::Model;
#$Id: Model.pm 24 2007-07-07 21:07:58Z apeiron $
use strict;
use warnings FATAL => 'all';
use vars qw#@EXPORT#;

use Module::Pluggable::Ordered;

use Exporter 'import';
@EXPORT = qw#establish_model get_wanted_conf_data#;

our $VERSION = '0.02';

sub establish_model
{
	my $pkg = shift;
	my $uri = shift;
	my $input = {};
	Incunabulum::Model->call_plugins('get_data', $uri, \$input);
	return $input;
}

sub get_wanted_conf_data
{
	my $pkg = shift;
	my $config = shift;
	Incunabulum::Model->call_plugins('get_wanted_conf_data', \$config);
}

1;
