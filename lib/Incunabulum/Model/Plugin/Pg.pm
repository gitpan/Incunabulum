package Incunabulum::Model::Plugin::Pg;
#$Id: Pg.pm 34 2007-07-11 22:09:25Z apeiron $
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

__END__

=head1 NAME

Incunabulum::Model::Plugin::Pg -- DBD::Pg Model plugin for Incunabulum

=head1 SYNOPSIS

No user-serviceable parts inside for the moment.

=head1 DESCRIPTION

This plugin gets stuff from a PostgreSQL database using some configuration data.
Its API docs don't exist, so its interface doesn't exist.

=over 4

=item get_data

NOTE: This documentation placed here so Test::Pod::Coverage is happy. I know
that I should document (and test...) this code better. But that's not really
feasible with a non-existent API definition.

Retrieves data from a PostgreSQL database.

=item get_data_order

The MPO order for get_data_order.

=back

=head1 SEE ALSO

L<Incunabulum>.
