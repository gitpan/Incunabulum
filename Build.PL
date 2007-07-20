#$Id: Build.PL 34 2007-07-11 22:09:25Z apeiron $
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Incunabulum',
    license             => 'Perl',
    dist_author         => 'Christopher Nehren <apeiron@coitusmentis.info>',
    dist_version_from   => 'lib/Incunabulum.pm',
    requires =>
    {
        'Test::More' => 0,
        'Module::Pluggable::Ordered' => 0,
    },
    add_to_cleanup      => [ 'Incunabulum-*' ],
);

$builder->create_build_script();
