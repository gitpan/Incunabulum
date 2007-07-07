package Incunabulum::View::Plugin::Dumper;
#$Id: Dumper.pm 24 2007-07-07 21:07:58Z apeiron $
use strict;
use warnings FATAL => 'all';

use Apache2::RequestRec ();
use Apache2::RequestIO ();
use Apache2::Const -compile => qw(OK);

use Data::Dumper;

our $VERSION = '0.02';

# Since you're not likely to use this View with any other view, this sub doesn't
# really matter, but leave it here anyway.

sub do_view_order {1}

sub do_view
{
	my $pkg = shift;
	my $r = shift;
	my $data = shift;
	my $data_pointer = shift;
	$r->content_type('text/plain');
	my $d = Data::Dumper->new([$pkg, $r, $data, $data_pointer]);
	print $d->Dump();
	return 0;
}

1;
