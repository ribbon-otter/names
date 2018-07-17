use v6;

grammar LINE {
	token TOP { ^ <name> \s+ <probability> \s+ <cumulative> \s+ <rank> \s* $ }
	token real { \d+[\.\d+]? }
	token probability  { <real> }
	token cumulative  { <real> }
	token rank { \d+ }
	token name { \w+ }
}


sub get-name(Str $filename) {
	my $selected = 90.023.rand();
	my $file = $filename.IO.open;
	while $_ = $file.get() {
		.chomp;
		my $match = LINE.parse( $_ );
		if $match<cumulative> > $selected {
					return (~$match<name>).tclc;
			}
	}
	$file.close();
}

sub get-female() {
	return get-name("dist.female.first");
}

sub get-male() {
	return get-name("dist.male.first");
}

sub get-last() {
	return get-name("dist.all.last");
}

enum Gender ( male => "male", female => "female", both => "both" );
constant %REVERSE_GENDER = Map("male" => male, "female" => female, "both" => both);


multi sub get-first(Str $gender) {
	say("hello");
	get-first %REVERSE_GENDER{$gender}

}

multi sub get-first(Gender $gender=both) {
	given $gender {
			when male {get-male()}
			when female {get-female()}
			when both {rand > .5 ?? get-female() !! get-male()}	
		};
}

multi sub get-full(Str $gender ) {
	say "helo";
	get-full %REVERSE_GENDER{$gender};
}
multi sub get-full(Gender $gender=both) {
	say "here";
	my $first = get-first($gender);
	my $last = get-last();
	return "$first $last";

}

say get-full(both);
say get-full(female);
say get-full(male);

say get-full("both");
say get-full("female");
say get-full("male");
