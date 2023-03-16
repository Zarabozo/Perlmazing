$| = 1;
use Perlmazing;

dir '.', 1, sub {
    my $item = shift;
    return unless -f $item;
    return if -b $item;
    open my $in, '<', $item or die $!;
    binmode $in;
    my $data = join '', <$in>;
    close $in;
    if ($data =~ /\r\n/) {
        pl $item;
        $data =~ s/\r\n/\n/g;
        unlink $item;
        open my $out, '>', $item or do { warn $!; return };
        binmode $out;
        print $out $data;
        close $out;
    }
}
