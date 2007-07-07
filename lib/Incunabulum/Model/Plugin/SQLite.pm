package Incunabulum::Model::Plugin::SQLite;
#$Id: SQLite.pm 24 2007-07-07 21:07:58Z apeiron $
use strict;
use warnings FATAL => 'all';

use DBI;

use Incunabulum::Config;

our $VERSION = '0.02';

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
