package Incunabulum::Model::Plugin::Test;
#$Id: Test.pm 34 2007-07-11 22:09:25Z apeiron $
use strict;
use warnings FATAL => 'all';

our $VERSION = '0.03';

sub get_data_order {1}

sub get_data
{
    my $pkg = shift;
    my $uri = shift;
    my $input = shift;
    $$input{'hello'} = "Hello, world!\n";
}

1;

__END__

=head1 NAME

Incunabulum::Model::Plugin::Test -- Test Model plugin for Incunabulum

=head1 SYNOPSIS

No user-serviceable parts inside for the moment.

=head1 DESCRIPTION

Just a simple test returning a hardcoded string. Most probably to be used with
L<Incunabulum::View::Plugin::Dumper>.

=over 4

=item get_data

NOTE: This documentation placed here so Test::Pod::Coverage is happy. I know
that I should document (and test...) this code better. But that's not really
feasible with a non-existent API definition.

Just returns a "Hello, world!\n".

=item get_data_order

The MPO order for get_data.

=back

=head1 SEE ALSO

L<Incunabulum>.
