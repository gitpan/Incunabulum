package Incunabulum::Config::Plugin::Hardcode;
#$Id: Hardcode.pm 31 2007-07-11 17:44:21Z apeiron $
use strict;
use warnings FATAL => 'all';

use Incunabulum::Config;

our $VERSION = '0.03';

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

__END__

=head1 NAME

Incunabulum::Config::Plugin::Hardcode -- Directly access and hardcode
configuration data for Incunabulum.

=head1 SYNOPSIS

No user-serviceable parts inside for the moment.

=head1 DESCRIPTION

It's an ugly hack, yes. It's going to be supplanted very soon, yes.

=over

=item get_config_data

NOTE: This documentation placed here so Test::Pod::Coverage is happy. I know
that I should document (and test...) this code better. But that's not really
feasible with a non-existent API definition.

Sets up hardcoded configuration values, accessing the underlying data structure
directly.

=item get_config_data_order

The MPO order for get_config_data.

=back

=head1 SEE ALSO

L<Incunabulum>, L<Incunabulum::Config::Plugin::FlatFile>
