package Incunabulum::View;
#$Id: View.pm 27 2007-07-08 08:39:18Z apeiron $
use strict;
use warnings FATAL => 'all';
use vars qw#@EXPORT#;

use Module::Pluggable::Ordered;

use Exporter 'import';
@EXPORT = qw#present_view get_wanted_conf_data#;

our $VERSION = '0.03';

sub present_view
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

sub get_wanted_conf_data
{
	my $pkg = shift;
	my $config = shift;
	Incunabulum::View->call_plugins('get_wanted_conf_data', \$config);
}

1;

__END__

=head1 NAME

Incunabulum::View -- User interface management code

=head1 SYNOPSIS

No user-serviceable parts inside for the moment.

=head1 DESCRIPTION

The B<View> component of the MVC framework implements user interface, or some
other kind of information or entities meant for user consumption.

=over

=item present_view

NOTE: This documentation placed here so Test::Pod::Coverage is happy. I know
that I should document (and test...) this code better. But that's not really
feasible with a non-existent API definition.

Invokes the View plugins to output their presentation layers.

=item get_wanted_conf_data

Polls the View plugins for the configuration variables they expect.

=back

=head1 SEE ALSO

L<Incunabulum>.
