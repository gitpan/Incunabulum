package Incunabulum::Controller::Plugin::mod_perl2;
#$Id: mod_perl2.pm 24 2007-07-07 21:07:58Z apeiron $
use strict;
use warnings FATAL => 'all';

use Apache2::RequestRec ();
use Apache2::RequestIO ();
use Apache2::Const -compile => qw(OK);

use Module::Pluggable::Ordered;

use Incunabulum::Model;
use Incunabulum::View;

our $VERSION = '0.02';

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
