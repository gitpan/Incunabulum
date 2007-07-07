package Incunabulum::Controller;
#Id#
use strict;
use warnings FATAL => 'all';
use vars qw#@EXPORT#;

use Module::Pluggable::Ordered;

use Exporter 'import';
@EXPORT = qw#get_wanted_conf_data#;

our $VERSION = '0.01';

sub get_wanted_conf_data($)
{
	my $pkg = shift;
	my $config = shift;
	Incunabulum::Controller->call_plugins('get_wanted_conf_data', $config);
}

1;
__END__

=head1 NAME

Incunabulum::Controller - Incunabulum's Controller implementation hierarchy.

=head1 SYNOPSIS

No user-serviceable parts inside. You should be (surprise!) using a plugin
instead of this module. 

=head1 DESCRIPTION

See L<Incunabulum::Docs::Devel::Controller>.

=head1 FUNCTIONS, METHODS

Nothing meant for public consumption. See L<Incunabulum::Devel> regarding any
code you see in this module, specifically the "Public API" section.

=head1 SEE ALSO

L<Incunabulum::Docs::Devel::Controller>, L<Incunabulum::Docs::Devel>,
L<Incunabulum::Docs>

The documentation for existing Controller plugins.

=head1 COPYRIGHT, AUTHORS

See L<Incunabulum> for this information.
