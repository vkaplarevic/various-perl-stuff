#!/usr/bin/perl -I/Users/vlkaplarevic/work/perl/bless/lib/

use strict;
use warnings;
use v5.14;

use Obj::Person;

sub main {
    my $p = Obj::Person::new({
            first_name  => 'John',
            last_name   => 'Doe',
        });
    
    say STDERR $p->get_first_name;
    say STDERR $p->get_last_name;
}

main();

