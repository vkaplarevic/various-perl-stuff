#!/usr/bin/perl -Ilib/

use strict;
use warnings;
use v5.14;

use Obj::Person;

sub main {
    my $p = Obj::Person::new({
            first_name  => 'John',
            last_name   => 'Doe',
        });
    
    say STDOUT $p->get_first_name;
    say STDOUT $p->get_last_name;
}

main();

