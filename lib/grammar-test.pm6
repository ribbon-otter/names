grammar REST { 
	token TOP{ '/' <subject> '/' <command> [ '/' <data> ]? }
	token subject { \w+ }
	token command { \w+ }
	token data    { .* }
 }
                 
my $m = REST.parse('/product/create');
say $m<subject>, $m<command>;

