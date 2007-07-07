package Incunabulum::Model;
#Id#
use strict;
use warnings FATAL => 'all';
use vars qw#@EXPORT#;

use Module::Pluggable::Ordered;

use Exporter 'import';
@EXPORT = qw#establish_model get_wanted_conf_data register_data#;

our $VERSION = '0.01';

my $input;

sub establish_model($)
{
	my $pkg = shift;
	my $uri = shift;
	Incunabulum::Model->call_plugins('get_data', $uri);
	return $input;
}

sub register_data
{
	$input = +shift;
}

sub get_wanted_conf_data($)
{
	my $pkg = shift;
	my $config = shift;
	Incunabulum::Model->call_plugins('get_wanted_conf_data', $config);
}

1;
