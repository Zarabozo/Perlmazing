use Perlmazing;

sub main (+) {
	my $list = $_[0];
	if (isa_hash $list) {
		if (void_context()) {
			my @call = caller(0);
			warn "Useless call to sort_by_key for a hash in void context (keys won't remain sorted in a hash) at $call[1] line $call[2]\n";
			return;
		}
		$list = [%$list];
	} elsif (not isa_array $list) {
		return $_[0];
	}
	my @temp;
	for (my $i = 0; $i < @$list; $i += 2) {
		push @temp, {key => $list->[$i], value => $list->[$i + 1]};
	}
	@temp = map {$_->{key}, $_->{value}} sort {
		if (lc $a->{value} eq lc $b->{value}) {
			numeric ($a->{value}, $b->{value});
		} else {
			numeric (lc $a->{value}, lc $b->{value});
		}
	} @temp;
	if (list_context()) {
		@temp;
	} elsif (scalar_context()) {
		\@temp;
	} else {
		@{$_[0]} = @temp;
	}
}

