use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

my %dependencies = (
	'ExtUtils::MakeMaker' => 0,
	'Carp' => 0,
	'Crypt::Rijndael' => 0,
	'Cwd' => 0,
	'Data::Dump' => 0,
	'Digest::MD5' => 0,
	'Encode' => 0,
	'Encoding' => 0,
	'File::Copy::Recursive' => 0,
	'File::Path' => 0,
	'List::Util' => 0,
	'Scalar::Util' => 0,
	'Submodules' => 0,
	'Taint::Util' => 0,
	'Time::Precise' => 0,
	'URI::Escape' => 0,
	'strict' => 0,
	'version' => 0,
	'warnings' => 0,
);

WriteMakefile(
    NAME             => 'Perlmazing',
    AUTHOR           => q{Francisco Zarabozo <zarabozo@cpan.org>},
    VERSION_FROM     => 'lib/Perlmazing.pm',
    ABSTRACT_FROM    => 'lib/Perlmazing.pm',
    LICENSE          => 'perl_5',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        %dependencies,
    },
    BUILD_REQUIRES => {
        %dependencies,
    },
    TEST_REQUIRES => {
        %dependencies,
    },
    PREREQ_PM => {
        %dependencies,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Perlmazing-*' },
);
