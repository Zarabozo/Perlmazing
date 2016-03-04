use Perlmazing;

sub main {
	my ($path, $recursive, $callback) = ('.', 0, '');
	my $wantarray = wantarray;
	if (@_ == 1) {
		if (ref($_[0]) and ref($_[0]) eq 'CODE') {
			$callback = $_[0];
		} elsif (-d $_[0]) {
			$path = $_[0];
		} else {
			$recursive = 1;
		}
	} elsif (@_ == 2) {
		if (-d $_[0]) {
			$path = $_[0];
			if (ref($_[1]) and ref($_[1]) eq 'CODE') {
				$callback = $_[1];
			} else {
				$recursive = $_[1];
			}
		} else {
			if (ref($_[0]) and ref($_[0]) eq 'CODE') {
				$callback = $_[0];
				$recursive = $_[1];
			} elsif (ref($_[1]) and ref($_[1]) eq 'CODE') {
				$recursive = $_[0];
				$callback = $_[1];
			} else {
				croak "I don't understand your parameters. None of them are a valid path and none of them is a callback (coderef).";
			}
		}
	} elsif (@_ == 3) {
		$path = $_[0];
		if (ref($_[1]) and ref($_[1]) eq 'CODE') {
			$callback = $_[1];
			$recursive = $_[2];
		} else {
			$recursive = $_[1];
			$callback = $_[2];
		}
	}
	croak "Path '$path' is not a valid path or cannot be read" unless -d $path;
	croak "The callback parameter must be a code reference" if $callback and (not ref($callback) or ref($callback) ne 'CODE');
	$path =~ s|[/\\]+$||;
	_dir($path, $recursive, $callback, $wantarray);
}

sub _dir {
	my ($path, $recursive, $callback, $wantarray) = @_;
	if (opendir my $d, $path) {
		my @results;
		for my $i (readdir $d) {
			next if $i eq '.' or $i eq '..';
			$i = "$path/$i";
			push (@results, $i) if $wantarray;
			if ($callback) {
				$callback->($i);
			}
			if (-d $i and $recursive) {
				my @r = _dir($i, $recursive, $callback, $wantarray);
				push (@results, @r) if $wantarray;
			}
		}
		if ($wantarray) {
			@results = sort numeric @results;
			return @results;
		}
	} else {
		warn "Cannot read path $path: $!";
	}
	return;
}

1;