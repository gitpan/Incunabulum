package Incunabulum::View::Plugin::Dumper;
#$Id: Dumper.pm 34 2007-07-11 22:09:25Z apeiron $
use strict;
use warnings FATAL => 'all';

use Apache2::RequestRec ();
use Apache2::RequestIO ();
use Apache2::Const -compile => qw(OK);

use Data::Dumper;

our $VERSION = '0.03';

# Since you're not likely to use this View with any other view, this sub doesn't
# really matter, but leave it here anyway.

sub do_view_order {1}

sub do_view
{
    print Dumper(@_);
    return 0;
}

1;

__END__

=head1 NAME

Incunabulum::View::Plugin::Dumper -- Dumps everything via Data::Dumper to the
currently C<select()>'d filehandle.

=head1 SYNOPSIS

No user-serviceable parts inside for the moment.

=head1 DESCRIPTION

Does exactly what it says. No processing of arguments or anything, just dumps
straight to whatever's been most recently C<select()>'d. Great for debugging,
not much else (primitive network-oriented serialisation, maybe?).

=over 4

=item do_view

NOTE: This documentation placed here so Test::Pod::Coverage is happy. I know
that I should document (and test...) this code better. But that's not really
feasible with a non-existent API definition.

View that uses Data::Dumper. I really don't see this particular module's
documentation becoming much larger than this.

=item do_view_order

The MPO order for do_view.

=back

=head1 SEE ALSO

L<Incunabulum>.
