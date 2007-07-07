package Incunabulum::Model::Plugin::Pg;
#$Id: Pg.pm 14 2007-07-07 03:35:33Z apeiron $
use strict;
use warnings FATAL => 'all';

use DBI;

use Incunabulum::Config;
use Incunabulum::Model qw#register_data#;

use Data::Dumper;

our $VERSION = '0.01';

sub get_data_order {1}

sub get_data
{
	my $pkg = shift;
	my $uri = shift;
	my $config = Incunabulum::Config->get_config_tree('incunabulum.model.plugin.pg');
	my $dbh = DBI->connect('dbi:Pg:dbname=' . $$config{'dbname'} .
		";host=$$config{'dbhost'};port=$$config{'dbport'}", $$config{dbuser},
		$$config{dbpass});
	my $rows = $dbh->selectall_arrayref('SELECT id, added_date, author,
		subject, body from blog order by id', {Slice => {}});
	Incunabulum::Model::register_data($rows);
}

1;
