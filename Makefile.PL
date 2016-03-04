use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Perlmazing',
    AUTHOR           => q{Francisco Zarabozo <zarabozo@cpan.org>},
    VERSION_FROM     => 'lib/Perlmazing.pm',
    ABSTRACT_FROM    => 'lib/Perlmazing.pm',
    LICENSE          => 'perl_5',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
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
		'Taint::Util' => 0,
		'Time::Precise' => 0,
		'URI::Escape' => 0,
    },
    PREREQ_PM => {
        #'ABC'              => 1.6,
        #'Foo::Bar::Module' => 5.0401,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Perlmazing-*' },
);
