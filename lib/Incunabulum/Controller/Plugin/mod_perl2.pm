package Incunabulum::Controller::Plugin::mod_perl2;
#$Id: mod_perl2.pm 27 2007-07-08 08:39:18Z apeiron $
use strict;
use warnings FATAL => 'all';

use Apache2::RequestRec ();
use Apache2::RequestIO ();
use Apache2::Const -compile => qw(OK);

use Module::Pluggable::Ordered;

use Incunabulum::Model;
use Incunabulum::View;

our $VERSION = '0.03';

sub handler
{
	my $r = shift;
	my $uri = $r->uri();
	my $data = establish_model($uri);
	my $retcode = present_view($r, $data);
	if(0 == $retcode)
	{
		return Apache2::Const::OK;
	}
	else
	{
		$r->content_type('text/plain');
		print "Oh no!\n";
	}
}
1;

__END__

=head1 NAME

Incunabulum::Controller::Plugin::mod_perl2 -- mod_perl 2.x Controller plugin for
Incunabulum

=head1 SYNOPSIS

No user-serviceable parts inside for the moment.

=head1 DESCRIPTION

Your basic mod_perl 2.x handler. Doesn't do anything spectacular at the moment.

=over

=item handler

NOTE: This documentation placed here so Test::Pod::Coverage is happy. I know
that I should document (and test...) this code better. But that's not really
feasible with a non-existent API definition.

Basic mod_perl 2 handler. Nothing special.

=back

=head1 SEE ALSO

L<Incunabulum>.
