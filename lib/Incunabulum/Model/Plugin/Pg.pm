package Incunabulum::Model::Plugin::Pg;
#$Id: Pg.pm 24 2007-07-07 21:07:58Z apeiron $
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
	my $config = Incunabulum::Config->get_config_tree('incunabulum.model.plugin.pg');
	my $dbname = $$config{'dbname'};
	my $host = $$config{'dbhost'};
	my $port = $$config{'dbport'};
	my $user = $$config{'dbuser'};
	my $pass = $$config{'dbpass'};
	my $dbh = DBI->connect("dbi:Pg:dbname=$dbname;host=$host;port=$port",
		$user, $pass);
	my $rows = $dbh->selectall_arrayref('SELECT id, added_date, author,
		subject, body from blog order by id', {Slice => {}});
	$$input = $rows;
}

1;
