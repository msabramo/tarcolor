#!/usr/bin/perl -w

use strict;
use Getopt::Long;
use Scalar::Util qw(looks_like_number);

# Colors output of `tar tvf` or `ls -l` similarly to the way GNU ls (in GNU
# coreutils) would color a directory listing.
#
# Colors can be customized using an environment variable:
#
# TAR_COLORS='di=01;34:ln=01;36:ex=01;32:so=01;40:pi=01;40:bd=34;46:cd=34;43:su=0;41:sg=0;46'
#
# The format for TAR_COLORS is similar to the format used by LS_COLORS
# Check out the online LSCOLORS generator at http://geoff.greer.fm/lscolors/

my %FILE_TYPE_TO_COLOR = (
	"di" => "\033[01;34m",
	"ln" => "\033[01;36m",
	"ex" => "\033[01;32m",
	"so" => "\033[01;35m",
	"pi" => "\033[01;40m",
	"bd" => "\033[34;46m",
	"cd" => "\033[34;43m",
);

foreach (split(':', $ENV{'TAR_COLORS'})) {
	my ($type, $codes) = split('=');
	$FILE_TYPE_TO_COLOR{$type} = "\033[" . $codes . "m";
}

my $RESET = "\033[0m";

sub get_file_type {
    if (substr($_, 0, 1) eq 'l') {
		return 'ln';
	} elsif (substr($_, 0, 1) eq 'd') {
		return 'di';
	} elsif (substr($_, 0, 1) eq 's') {
		return 'so';
	} elsif (substr($_, 3, 1) eq 'S') {
		return 'su';
	} elsif (substr($_, 6, 1) eq 'S') {
		return 'sg';
	} elsif (substr($_, 0, 1) eq 'p') {
		return 'pi';
	} elsif (substr($_, 0, 1) eq 'c') {
		return 'cd';
	} elsif (substr($_, 0, 1) eq 'b') {
		return 'bd';
	} elsif (substr($_, 0, 1) eq 'D') {
		return 'do';
	} elsif (substr($_, 3, 1) eq 'x') {
		return 'ex';
	}
}

sub color_filename {
    my ($filename, $color) = @_;

    s {$filename} {${color}${filename}${RESET}}x;
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
	my $type = get_file_type();

	if ($type) {
		color_filename($filename, $FILE_TYPE_TO_COLOR{$type});
	}

    print;
}

