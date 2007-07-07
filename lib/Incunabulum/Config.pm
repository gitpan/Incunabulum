package Incunabulum::Config;
#$Id: Config.pm 24 2007-07-07 21:07:58Z apeiron $
use strict;
use warnings FATAL => 'all';

use Exporter 'import';
use vars qw#@EXPORT @EXPORT_OK#;

use Module::Pluggable::Ordered;

our @EXPORT = qw#do_config#;

our $VERSION = '0.02';

my $config;

sub do_config
{
	my $pkg = shift;
	$config = shift;
	Incunabulum::Config->call_plugins('get_config_data', \$config);
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
