package Incunabulum::Config;
#$Id: Config.pm 34 2007-07-11 22:09:25Z apeiron $
use strict;
use warnings FATAL => 'all';

use Exporter 'import';
use vars qw#@EXPORT @EXPORT_OK#;

use Module::Pluggable::Ordered;

our @EXPORT = qw#do_config#;

our $VERSION = '0.03';

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

__END__

=head1 NAME

Incunabulum::Config -- Programmatic configuration system

=head1 SYNOPSIS

No user-serviceable parts inside for the moment.

=head1 DESCRIPTION

Yep, your basic run of the mill configuration system here. Nothing too much, but
it gets the job done for my proof of concept. Like the rest of Incunabulum,
this will be embellished with time.

=over 4

=item do_config

NOTE: This documentation placed here so Test::Pod::Coverage is happy. I know
that I should document (and test...) this code better. But that's not really
feasible with a non-existent API definition.

Gathers configuration data from the various configuration plugins and stores it
in a variable.

=item get_config_tree

Changes sysctl-style strings into data structures.

=back

=head1 SEE ALSO

L<Incunabulum>.
