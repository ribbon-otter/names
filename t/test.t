use v6;
use Test;
use lib '../lib';
use Names;

#this code is under MIT license

plan 7;
ok(get-full().split(" ").elems === 2);
#In theory this could fail rarely, but it is a low enough rate that it shouldn't matter to much 
ok(not get-first() eq get-first() eq get-first() eq get-first() eq get-first());
ok(not get-full() eq get-full() eq get-full() eq get-full() eq get-full());
ok(not get-full("female") eq get-full("female") eq get-full("female") eq get-full("female") eq get-full("female"));
ok(not get-full(female) eq get-full(female) eq get-full(female) eq get-full(female) eq get-full(female));
ok(not get-full(male) eq get-full(male) eq get-full(male) eq get-full(male) eq get-full(male));
ok(not get-full("male") eq get-full("male") eq get-full("male") eq get-full("male") eq get-full("male"));
