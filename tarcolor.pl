#!/usr/bin/perl

while (<>) {
    $line = $_;
    $filename = (split())[8];
    
    if (substr($line, 0, 1) eq 'l') {
        s#\Q$filename\E#\033[1;36m$filename\033[0m#;
    }
    elsif (substr($line, 0, 1) eq 'd') {
        s#\Q$filename\E#\033[1;34m$filename\033[0m#;
    }
    elsif (substr($line, 3, 1) eq 'x') {
        s#\Q$filename\E#\033[1;32m$filename\033[0m#;
    }

    print;
}
