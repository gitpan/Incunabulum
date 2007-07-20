#$Id: Makefile.PL 34 2007-07-11 22:09:25Z apeiron $
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile
(
    NAME                => 'Incunabulum',
    AUTHOR              => 'Christopher Nehren <apeiron@cpan.org>',
    VERSION_FROM        => 'lib/Incunabulum.pm',
    ABSTRACT_FROM       => 'lib/Incunabulum.pm',
    PL_FILES            => {},
    PREREQ_PM =>
    {
        'Test::More' => 0,
        'Module::Pluggable::Ordered' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Incunabulum-*' },
);
