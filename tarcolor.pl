#!/usr/bin/perl -w

use strict;

my $CYAN     = "\033[1;36m";
my $BLUE     = "\033[1;34m";
my $GREEN    = "\033[1;32m";
my $RESET    = "\033[0m";

while (<>) {
    my $filename = (split())[8];
    
    if (substr($_, 0, 1) eq 'l') {
        s {$filename} {${CYAN}${filename}${RESET}}x;
    }
    elsif (substr($_, 0, 1) eq 'd') {
        s {$filename} {${BLUE}${filename}${RESET}}x;
    }
    elsif (substr($_, 3, 1) eq 'x') {
        s {$filename} {${GREEN}${filename}${RESET}}x;
    }

    print;
}
