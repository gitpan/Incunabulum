package Incunabulum::Config;
#Id#
use strict;
use warnings FATAL => 'all';

use Exporter 'import';
use vars qw#@EXPORT @EXPORT_OK#;

use Module::Pluggable::Ordered;

our @EXPORT = qw#do_config write_config#;

our $VERSION = '0.01';

my $config;

sub do_config
{
	my $pkg = shift;
	$config = shift;
	Incunabulum::Config->call_plugins('get_config_data');
}

sub write_config
{
	$config = +shift;
}

sub get_config_tree
{
	my $pkg = shift;
	my $subtree = shift;
        my @parts = split /\./, $subtree;
        my $tree = $config;
        for my $part(@parts)
        {
                $tree = $$tree{$part};
        }
        return $tree;
}
1;
