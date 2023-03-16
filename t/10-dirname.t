use lib 'lib';
use lib '../lib';
use 5.006;
use strict;
use warnings;
use Test::More tests => 10;
use Perlmazing;

my $path_1 = '/usr/bin/perl';
my $path_2 = '/home/fzarabozo/debug.log';
my $path_3 = 'filename.txt';
my @paths = ($path_1, $path_2, $path_3);
my @dirs = dirname @paths;
my $file_1 = dirname $path_1;
my $file_2 = dirname $path_2;
my $file_3 = dirname $path_3;

is scalar @dirs, scalar @paths, 'Expected size of return is correct.';
is $paths[0], '/usr/bin/perl', 'Path 1 is unaltered';
is $paths[1], '/home/fzarabozo/debug.log', 'Path 2 is unaltered';
is $paths[2], 'filename.txt', 'Path 3 is unaltered';
is $dirs[0], '/usr/bin', 'Directory 1 is correct';
is $dirs[1], '/home/fzarabozo', 'Directory 2 is correct';
is $dirs[2], '.', 'Directory 3 is correct';
is $file_1, '/usr/bin', 'File 1 is correct';
is $file_2, '/home/fzarabozo', 'File 2 is correct';
is $file_3, '.', 'File 3 is correct';

