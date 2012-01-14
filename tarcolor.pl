#!/usr/bin/perl -w

use strict;
use Getopt::Long;
use Scalar::Util qw(looks_like_number);
use Term::ANSIColor;

# Colors output of `tar tvxf` or `ls -l` the way GNU ls (in GNU coreutils)
# would color a directory listing if the environment variable LS_COLORS was set
# to:
#
# LS_COLORS='di=01;34:ln=01;36:ex=01;32:

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
	my $colored_filename = colored($filename, $color);

	s {$filename} {$colored_filename}x;
}

sub get_filename_column {
	my (@fields) = @_;

	if (looks_like_number($fields[1])) {
		return 8;
	} else {
		return 5;
	}
}

my $filename_column = 8;

my $result = GetOptions(
    "filename-column=i"  => \$filename_column
);

while (<>) {
	my @fields = split();
	my $filename_column = get_filename_column(@fields);
    my $filename = $fields[$filename_column];
	my $color = '';

    if (is_link) {
		$color = 'bold cyan';
    }
    elsif (is_directory) {
        $filename =~ s {\/$} {}x;
		$color = 'bold blue';
    }
    elsif (is_executable) {
        $filename =~ s {\*} {}x;
		$color = 'bold green';
    }

	if ($color) {
		color_filename($filename, $color);
	}

    print;
}

