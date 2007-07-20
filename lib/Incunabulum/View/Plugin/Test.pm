package Incunabulum::View::Plugin::Test;
#$Id: Test.pm 34 2007-07-11 22:09:25Z apeiron $
use strict;
use warnings FATAL => 'all';

use Apache2::RequestRec ();
use Apache2::RequestIO ();
use Apache2::Const -compile => qw(OK);

our $VERSION = '0.03';

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

__END__

=head1 NAME

Incunabulum::View::Plugin::Test -- Test output plugin with hardcoded hash key
accessing.

=head1 SYNOPSIS

No user-serviceable parts inside for the moment.

=head1 DESCRIPTION

Yet another very simple bit of code that is there to get a proof of concept up
and running. Assuming your database s tructure is appropriate, this will display
content in a blog-esque fashion.

=over 4

=item do_view

NOTE: This documentation placed here so Test::Pod::Coverage is happy. I know
that I should document (and test...) this code better. But that's not really
feasible with a non-existent API definition.

A test view, which is used for my personal proof of concept. Don't count on
anything it does to work in the future.

=item do_view_order

The MPO order for do_view.

=back

=head1 SEE ALSO

L<Incunabulum>.
