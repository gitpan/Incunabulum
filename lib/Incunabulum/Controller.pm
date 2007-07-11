package Incunabulum::Controller;
#$Id: Controller.pm 27 2007-07-08 08:39:18Z apeiron $
use strict;
use warnings FATAL => 'all';
use vars qw#@EXPORT#;

use Module::Pluggable::Ordered;

use Exporter 'import';
@EXPORT = qw#get_wanted_conf_data#;

our $VERSION = '0.03';

sub get_wanted_conf_data
{
	my $pkg = shift;
	my $config = shift;
	Incunabulum::Controller->call_plugins('get_wanted_conf_data', \$config);
}

1;

__END__

=head1 NAME

Incunabulum::Controller -- Programmatic entrypoints into the Incunabulum MVC
framework.

=head1 SYNOPSIS

No user-serviceable parts inside. You should be (surprise!) using a plugin
instead of this module. 

=head1 DESCRIPTION

The B<Controller> aspect of the MVC framework, as Incunabulum realises it,
implements domain-specific programmatic entrypoints into the software. What this
means is that the various Controllers contain code that serve as the main method
of accomplishing tasks in Incunabulum, each catered to the particular
environment in which code will be calling Incunabulum. For example, there's one
for accessing Incunabulum via mod_perl 2.

=over

=item get_wanted_conf_data

NOTE: This documentation placed here so Test::Pod::Coverage is happy. I know
that I should document (and test...) this code better. But that's not really
feasible with a non-existent API definition.

Polls the Controller plugins for configuration data they require.

=back

=head1 SEE ALSO

L<Incunabulum>.
