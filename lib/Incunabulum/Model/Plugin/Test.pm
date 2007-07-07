package Incunabulum::Model::Plugin::Test;
#$Id: Test.pm 24 2007-07-07 21:07:58Z apeiron $
use strict;
use warnings FATAL => 'all';

our $VERSION = '0.02';

sub get_data_order {1}

sub get_data
{
	my $pkg = shift;
	my $uri = shift;
	my $input = shift;
	$$input{'hello'} = "Hello, world!\n";
}

1;
