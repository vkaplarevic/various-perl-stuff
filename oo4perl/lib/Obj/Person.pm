package Obj::Person;

use strict;
use warnings;
use v5.14;

use Exporter qw(import);
our @EXPORT_OK = qw(new);

#### This will create getters and setters!
sub create_accessors {
    my $class = shift;
    my $name = shift;

    no strict 'refs';
    * {"$class\:\:set_$name"} = sub {
        my $self = shift;
        my $new_val = shift;
        if ($new_val) {
            $self->{$name} = $new_val;
        } 
    };
    * {"$class\:\:get_$name"} = sub {
        my $self = shift;
        return $self->{$name}; 
    };
}


sub new {
    my $args = shift;
    my $self = {};

    foreach my $key ( keys %{ $args }) {
        $self->{$key} = $args->{$key};
        create_accessors(__PACKAGE__, $key);
    }

    return bless $self,  __PACKAGE__;
}

sub write {
    my $self = shift;
    say "$self->{first_name} $self->{last_name}";
}

1;
