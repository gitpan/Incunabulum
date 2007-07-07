package Incunabulum::View;
#Id#
use strict;
use warnings FATAL => 'all';
use vars qw#@EXPORT#;

use Module::Pluggable::Ordered;

use Exporter 'import';
@EXPORT = qw#present_view get_wanted_conf_data#;

our $VERSION = '0.01';

sub present_view($$)
{
	my $pkg = shift;
	my $r = shift;
	my $data = shift;
	my $data_pointer = 0;
	Incunabulum::View->call_plugins('do_view', $r, $data, \$data_pointer);
	if(0 == $data_pointer)
	{
		return 0;
	}
	else
	{
		return $data_pointer;
	}
}

sub get_wanted_conf_data($)
{
	my $pkg = shift;
	my $config = shift;
	Incunabulum::View->call_plugins('get_wanted_conf_data', $config);
}

1;
