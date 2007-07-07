package Incunabulum::View::Plugin::Test;
#$Id: Test.pm 24 2007-07-07 21:07:58Z apeiron $
use strict;
use warnings FATAL => 'all';

use Apache2::RequestRec ();
use Apache2::RequestIO ();
use Apache2::Const -compile => qw(OK);

our $VERSION = '0.02';

sub do_view_order {1}

sub do_view
{
	my $pkg = shift;
	my $data = shift;
	my @posts = @$data;
	for my $post(@posts)
	{
		print "\n\n";
		print $$post{subject};
		print "\n\n";
		print $$post{body};
		print "\n\n";
		print "Posted by $$post{author} at  $$post{added_date}";
		print "\n\n";
	}
	return 0;
}

1;
