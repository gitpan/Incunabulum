package Incunabulum::Model::Plugin::SQLite;
#$Id: SQLite.pm 27 2007-07-08 08:39:18Z apeiron $
use strict;
use warnings FATAL => 'all';

use DBI;

use Incunabulum::Config;

our $VERSION = '0.03';

sub get_data_order {1}

sub get_data
{
	my $pkg = shift;
	my $uri = shift;
	my $input = shift;
	my $config = Incunabulum::Config->get_config_tree('incunabulum.model.plugin.sqlite');
	my $dbh = DBI->connect('dbi:SQLite:dbname=' . $$config{'dbname'}, '', '');
	#my $dbh = DBI->connect('dbi:SQLite:dbname=' . $config->get_key('dbname'), '', '');
	my $rows = $dbh->selectall_arrayref('SELECT id, date, author, subject, body from blog order by id', { Slice => {} } );
	$input = $rows;
}

1;

__END__

=head1 NAME

Incunabulum::Model::Plugin::SQLite -- SQLite Model plugin for Incunabulum

=head1 SYNOPSIS

No user-serviceable parts inside for the moment.

=head1 DESCRIPTION

Currently unsupported DBD::SQLite Model plugin. I ran into permissions issues
accessing a SQLite file in my www directory as another user even if I owned the
file. That's a showstopper for me (I don't want to be user www to use
Incunabulum to access the DB from the command line). If you can make it work
with that kind of arrangement, I'd be happy to incorporate your fixes.

=over

=item get_data

NOTE: This documentation placed here so Test::Pod::Coverage is happy. I know
that I should document (and test...) this code better. But that's not really
feasible with a non-existent API definition.

Currently broken, gets data from a SQLite database.

=item get_data_order

The MPO order for get_data.

=back

=head1 SEE ALSO

L<Incunabulum>.
