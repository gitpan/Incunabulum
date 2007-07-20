package Incunabulum::Model;
#$Id: Model.pm 34 2007-07-11 22:09:25Z apeiron $
use strict;
use warnings FATAL => 'all';
use vars qw#@EXPORT#;

use Module::Pluggable::Ordered;

use Exporter 'import';
@EXPORT = qw#establish_model get_wanted_conf_data#;

our $VERSION = '0.03';

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

__END__

=head1 NAME

Incunabulum::Model -- Logic and / or data store.

=head1 SYNOPSIS

No user-serviceable parts inside for the moment.

=head1 DESCRIPTION

The B<Model> component of the MVC framework implements domain logic and possibly
data storing / retrieving. Incunabulum Models do both.

=over 4

=item establish_model

NOTE: This documentation placed here so Test::Pod::Coverage is happy. I know
that I should document (and test...) this code better. But that's not really
feasible with a non-existent API definition.

Calls the Model plugins to perform domain logic on the semantics of the request,
and to obtain data to feed to the View.

=item get_wanted_conf_data

Polls the Model plugins for the configuration variables they require.

=back

=head1 SEE ALSO

L<Incunabulum>.
