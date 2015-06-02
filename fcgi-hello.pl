#!/usr/bin/env plackup 

use warnings;
use strict;
use v5.10;
use Plack::Handler::FCGI;

### Playing with the plackup and FCGI...

my $app = sub 
{ 
    my $env = shift;
    my $env_message = "Environment:\n";
    $env_message .= (defined($env->{$_}) ? ("$_ => " . $env->{$_} . "\n") : "NONE\n") foreach(keys %{$env});

    my $rsp =  [
        '200',
        ['Content-Type' => 'text/plain'],
        [$env_message],
    ];
    return $rsp;
};

# Create a simple FCGI Server configuration.
my $server = Plack::Handler::FCGI->new(
    nproc  => 1,
    listen => ["localhost:9900"],
    detach => 0,
);

$server->run($app);

