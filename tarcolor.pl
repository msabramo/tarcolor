#!/usr/bin/perl -w

use strict;

my $CYAN     = "\033[1;36m";
my $BLUE     = "\033[1;34m";
my $GREEN    = "\033[1;32m";
my $RESET    = "\033[0m";

sub color_filename {
    my ($filename, $color) = @_;

    s {$filename} {${color}${filename}${RESET}}x;
}

while (<>) {
    my $filename = (split())[8];
    
    if (substr($_, 0, 1) eq 'l') {
        color_filename($filename, $CYAN);
    }
    elsif (substr($_, 0, 1) eq 'd') {
        color_filename($filename, $BLUE);
    }
    elsif (substr($_, 3, 1) eq 'x') {
        color_filename($filename, $GREEN);
    }

    print;
}
