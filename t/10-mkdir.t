use lib 'lib';
use lib '../lib';
use 5.006;
use strict;
use warnings;
use Test::More tests => 3;
use Perlmazing;

my $dir = 'mkdir_test_directory';

if (-e $dir) {
	rmdir $dir;
	die "Cannot rmdir $dir: $!" if -e $dir;
}

is ((-e $dir), undef, "$dir doesn't exist");

mkdir 'mkdir_test/one/two/three';
my $content = join "\n", dir 'mkdir_test', 1;

is 'mkdir_test/one
mkdir_test/one/two
mkdir_test/one/two/three', $content, 'directories created succesfully';

if (-e $dir) {
	rmdir $dir;
	die "Cannot rmdir $dir: $!" if -e $dir;
}

is ((-e $dir), undef, "$dir deleted successfully");