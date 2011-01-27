#!/usr/bin/perl -w

use strict;

# Colors output of `tar tvxf` or `ls -l` the way GNU ls (in GNU coreutils)
# would color a directory listing if the environment variable LS_COLORS was set
# to:
#
# LS_COLORS='di=01;34:ln=01;36:ex=01;32:

my $CYAN     = "\033[1;36m";
my $BLUE     = "\033[1;34m";
my $GREEN    = "\033[1;32m";
my $RESET    = "\033[0m";

sub is_link {
    substr($_, 0, 1) eq 'l';
}

sub is_directory {
    substr($_, 0, 1) eq 'd';
}

sub is_executable {
    substr($_, 3, 1) eq 'x';
}

sub color_filename {
    my ($filename, $color) = @_;

    s {$filename} {${color}${filename}${RESET}}x;
}

while (<>) {
    my $filename = (split())[8];
    
    if (is_link) {
        color_filename($filename, $CYAN);
    }
    elsif (is_directory) {
        $filename =~ s {\/$} {}x;
        color_filename($filename, $BLUE);
    }
    elsif (is_executable) {
        $filename =~ s {\*} {}x;
        color_filename($filename, $GREEN);
    }

    print;
}
