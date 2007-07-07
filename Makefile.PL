#$Id: Makefile.PL 14 2007-07-07 03:35:33Z apeiron $
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Incunabulum',
    AUTHOR              => 'Christopher Nehren <apeiron@cpan.org>',
    VERSION_FROM        => 'lib/Incunabulum.pm',
    ABSTRACT_FROM       => 'lib/Incunabulum.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
	'Module::Pluggable::Ordered' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Incunabulum-*' },
);
