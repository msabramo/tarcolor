#!/usr/bin/perl

use warnings;
use strict;

use Test::More;

plan tests => 16;

my $input;
my $expected;

$ENV{'LS_COLORS'} = '';
$ENV{'TAR_COLORS'} = '';


$input = <<END;
drwxr-xr-x  12 marca  admin       0 Jan 15 08:33 test_tar_archive/
brw-r--r--  0 root   admin    14,0 Jan 14 09:11 test_tar_archive/block_device
crw-r--r--  0 root   admin     0,0 Jan 14 09:10 test_tar_archive/char_device
drwxr-xr-x  2 marca  admin       0 Jan 14 08:57 test_tar_archive/directory/
-rwxr-xr-x  1 marca  CHEGG\\domain users 0 Jan 14 08:59 test_tar_archive/executable
prw-r--r--  1 marca  admin              0 Jan 14 09:01 test_tar_archive/fifo
-rw-r--r--  1 marca  CHEGG\\domain users 0 Jan 14 08:57 test_tar_archive/normal_file
-rw-r-Sr--  1 marca  admin              0 Jan 14 09:48 test_tar_archive/setgid_file
-rwSr--r--  1 marca  admin              0 Jan 14 09:47 test_tar_archive/setuid_file
-rw-r--r-T  1 marca  admin              0 Jan 14 09:17 test_tar_archive/sticky_file
lrwxr-xr-x  1 marca  admin              0 Jan 15 08:33 test_tar_archive/symlink -> normal_file
END

chomp($input);

$expected = <<END;
drwxr-xr-x  12 marca  admin       0 Jan 15 08:33 \e[01;34mtest_tar_archive/\e[0m
brw-r--r--  0 root   admin    14,0 Jan 14 09:11 \e[40;33;01mtest_tar_archive/block_device\e[0m
crw-r--r--  0 root   admin     0,0 Jan 14 09:10 \e[40;33;01mtest_tar_archive/char_device\e[0m
drwxr-xr-x  2 marca  admin       0 Jan 14 08:57 \e[01;34mtest_tar_archive/directory/\e[0m
-rwxr-xr-x  1 marca  CHEGG\\domain users 0 Jan 14 08:59 \e[01;32mtest_tar_archive/executable\e[0m
prw-r--r--  1 marca  admin              0 Jan 14 09:01 \e[40;33mtest_tar_archive/fifo\e[0m
-rw-r--r--  1 marca  CHEGG\\domain users 0 Jan 14 08:57 test_tar_archive/normal_file
-rw-r-Sr--  1 marca  admin              0 Jan 14 09:48 \e[30;43mtest_tar_archive/setgid_file\e[0m
-rwSr--r--  1 marca  admin              0 Jan 14 09:47 \e[37;41mtest_tar_archive/setuid_file\e[0m
-rw-r--r-T  1 marca  admin              0 Jan 14 09:17 test_tar_archive/sticky_file
lrwxr-xr-x  1 marca  admin              0 Jan 15 08:33 \e[01;36mtest_tar_archive/symlink\e[0m -> normal_file
END

is(`echo "$input" | bin/tarcolor`, $expected, "tar tvf test_tar_archive.tgz, no TAR_COLORS set");


$input = <<END;
drwxr-xr-x marca/admin       0 2012-01-15 08:33 test_tar_archive/
brw-r--r-- root/admin     14,0 2012-01-14 09:11 test_tar_archive/block_device
crw-r--r-- root/admin      0,0 2012-01-14 09:10 test_tar_archive/char_device
drwxr-xr-x marca/admin       0 2012-01-14 08:57 test_tar_archive/directory/
-rwxr-xr-x marca/CHEGG\\domain users 0 2012-01-14 08:59 test_tar_archive/executable
prw-r--r-- marca/admin              0 2012-01-14 09:01 test_tar_archive/fifo
-rw-r--r-- marca/CHEGG\\domain users 0 2012-01-14 08:57 test_tar_archive/normal_file
-rw-r-Sr-- marca/admin              0 2012-01-14 09:48 test_tar_archive/setgid_file
-rwSr--r-- marca/admin              0 2012-01-14 09:47 test_tar_archive/setuid_file
-rw-r--r-T marca/admin              0 2012-01-14 09:17 test_tar_archive/sticky_file
lrwxr-xr-x marca/admin              0 2012-01-15 08:33 test_tar_archive/symlink -> normal_file
END

chomp($input);

$expected = <<END;
drwxr-xr-x marca/admin       0 2012-01-15 08:33 \e[01;34mtest_tar_archive/\e[0m
brw-r--r-- root/admin     14,0 2012-01-14 09:11 \e[40;33;01mtest_tar_archive/block_device\e[0m
crw-r--r-- root/admin      0,0 2012-01-14 09:10 \e[40;33;01mtest_tar_archive/char_device\e[0m
drwxr-xr-x marca/admin       0 2012-01-14 08:57 \e[01;34mtest_tar_archive/directory/\e[0m
-rwxr-xr-x marca/CHEGG\\domain users 0 2012-01-14 08:59 \e[01;32mtest_tar_archive/executable\e[0m
prw-r--r-- marca/admin              0 2012-01-14 09:01 \e[40;33mtest_tar_archive/fifo\e[0m
-rw-r--r-- marca/CHEGG\\domain users 0 2012-01-14 08:57 test_tar_archive/normal_file
-rw-r-Sr-- marca/admin              0 2012-01-14 09:48 \e[30;43mtest_tar_archive/setgid_file\e[0m
-rwSr--r-- marca/admin              0 2012-01-14 09:47 \e[37;41mtest_tar_archive/setuid_file\e[0m
-rw-r--r-T marca/admin              0 2012-01-14 09:17 test_tar_archive/sticky_file
lrwxr-xr-x marca/admin              0 2012-01-15 08:33 \e[01;36mtest_tar_archive/symlink\e[0m -> normal_file
END

is(`echo "$input" | bin/tarcolor`, $expected, "gtar tvf test_tar_archive.tgz, no TAR_COLORS set");


$input = <<END;
drwxr-xr-x  0 marc   marc        0 Jan 27  2011 test_archive/
drwxr-xr-x  0 marc   marc        0 Jan 27  2011 test_archive/dir/
-rwxr-xr-x  0 marc   marc        0 Jan 27  2011 test_archive/executable
lrwxr-xr-x  0 marc   marc        0 Jan 27  2011 test_archive/link -> executable
END

chomp($input);

$expected = <<END;
drwxr-xr-x  0 marc   marc        0 Jan 27  2011 \e[01;34mtest_archive/\e[0m
drwxr-xr-x  0 marc   marc        0 Jan 27  2011 \e[01;34mtest_archive/dir/\e[0m
-rwxr-xr-x  0 marc   marc        0 Jan 27  2011 \e[01;32mtest_archive/executable\e[0m
lrwxr-xr-x  0 marc   marc        0 Jan 27  2011 \e[01;36mtest_archive/link\e[0m -> executable
END

is(`echo "$input" | bin/tarcolor`, $expected, "tar tvf test_archive.tar.gz, no TAR_COLORS set");


$input = <<END;
drwxr-xr-x marc/marc         0 2011-01-27 09:01 test_archive/
drwxr-xr-x marc/marc         0 2011-01-27 09:00 test_archive/dir/
-rwxr-xr-x marc/marc         0 2011-01-27 09:00 test_archive/executable
lrwxr-xr-x marc/marc         0 2011-01-27 09:01 test_archive/link -> executable
END

chomp($input);

$expected = <<END;
drwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;34mtest_archive/\e[0m
drwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;34mtest_archive/dir/\e[0m
-rwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;32mtest_archive/executable\e[0m
lrwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;36mtest_archive/link\e[0m -> executable
END

is(`echo "$input" | bin/tarcolor`, $expected, "gtar tvf test_archive.tar.gz, no TAR_COLORS set");


$input = <<END;
drwxr-xr-x marc/marc         0 2011-01-27 09:01 test_archive/
drwxr-xr-x marc/marc         0 2011-01-27 09:00 test_archive/dir/
-rwxr-xr-x marc/marc         0 2011-01-27 09:00 test_archive/executable
lrwxr-xr-x marc/marc         0 2011-01-27 09:01 test_archive/link -> executable
END

chomp($input);

$expected = <<END;
drwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;33mtest_archive/\e[0m
drwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;33mtest_archive/dir/\e[0m
-rwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;32mtest_archive/executable\e[0m
lrwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;36mtest_archive/link\e[0m -> executable
END

is(`echo "$input" | TAR_COLORS="di=01;33" bin/tarcolor`, $expected, "gtar tvf test_archive.tar.gz, TAR_COLORS di=\"01;33\" set");


$input = <<END;
drwxr-xr-x marc/marc         0 2011-01-27 09:01 test_archive/
drwxr-xr-x marc/marc         0 2011-01-27 09:00 test_archive/dir/
-rwxr-xr-x marc/marc         0 2011-01-27 09:00 test_archive/executable
lrwxr-xr-x marc/marc         0 2011-01-27 09:01 test_archive/link -> executable
END

chomp($input);

$expected = <<END;
drwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;34mtest_archive/\e[0m
drwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;34mtest_archive/dir/\e[0m
-rwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;33mtest_archive/executable\e[0m
lrwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;36mtest_archive/link\e[0m -> executable
END

is(`echo "$input" | TAR_COLORS="ex=01;33" bin/tarcolor`, $expected, "gtar tvf test_archive.tar.gz, TAR_COLORS ex=\"01;33\" set");


$input = <<END;
drwxr-xr-x marc/marc         0 2011-01-27 09:01 test_archive/
drwxr-xr-x marc/marc         0 2011-01-27 09:00 test_archive/dir/
-rwxr-xr-x marc/marc         0 2011-01-27 09:00 test_archive/executable
lrwxr-xr-x marc/marc         0 2011-01-27 09:01 test_archive/link -> executable
END

chomp($input);

$expected = <<END;
drwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;34mtest_archive/\e[0m
drwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;34mtest_archive/dir/\e[0m
-rwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;32mtest_archive/executable\e[0m
lrwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;33mtest_archive/link\e[0m -> executable
END

is(`echo "$input" | TAR_COLORS="ln=01;33" bin/tarcolor`, $expected, "gtar tvf test_archive.tar.gz, TAR_COLORS ln=\"01;33\" set");


$input = <<END;
-rwxr-xr-x marca/CHEGG\\domain users 0 2012-01-15 09:41 09
-rwxr-xr-x marca/CHEGG\\domain users 0 2012-01-15 09:41 Jan
-rwxr-xr-x marca/admin              0 2012-01-15 10:25 Jan2
-rw-r--r-- marca/admin              0 2012-01-15 10:27 filename with spaces
-rwxr-xr-x marca/CHEGG\\domain users 0 2012-01-15 09:31 rwx
lrwxr-xr-x marca/CHEGG\\domain users 0 2012-01-15 13:21 symlink with spaces -> filename with spaces
-rwxr-xr-x marca/CHEGG\\domain users 0 2012-01-15 09:39 users
lrwxr-xr-x marca/CHEGG\\domain users 0 2012-01-15 09:33 w -> rwx
END

chomp($input);

$expected = <<END;
-rwxr-xr-x marca/CHEGG\\domain users 0 2012-01-15 09:41 \e[01;32m09\e[0m
-rwxr-xr-x marca/CHEGG\\domain users 0 2012-01-15 09:41 \e[01;32mJan\e[0m
-rwxr-xr-x marca/admin              0 2012-01-15 10:25 \e[01;32mJan2\e[0m
-rw-r--r-- marca/admin              0 2012-01-15 10:27 filename with spaces
-rwxr-xr-x marca/CHEGG\\domain users 0 2012-01-15 09:31 \e[01;32mrwx\e[0m
lrwxr-xr-x marca/CHEGG\\domain users 0 2012-01-15 13:21 \e[40;34msymlink with spaces\e[0m -> filename with spaces
-rwxr-xr-x marca/CHEGG\\domain users 0 2012-01-15 09:39 \e[01;32musers\e[0m
lrwxr-xr-x marca/CHEGG\\domain users 0 2012-01-15 09:33 \e[40;34mw\e[0m -> rwx
END

is(`echo "$input" | TAR_COLORS="ln=40;34" bin/tarcolor`, $expected, "gtar tvf archive_with_rwx_filename.tgz, TAR_COLORS ln=\"40;34\" set");


$input = <<END;
-rwxr-xr-x  1 marca  CHEGG\\domain users 0 Jan 15 09:41 09
-rwxr-xr-x  1 marca  CHEGG\\domain users 0 Jan 15 09:41 Jan
-rwxr-xr-x  1 marca  admin              0 Jan 15 10:25 Jan2
-rw-r--r--  1 marca  admin              0 Jan 15 10:27 filename with spaces
-rwxr-xr-x  1 marca  CHEGG\\domain users 0 Jan 15 09:31 rwx
lrwxr-xr-x  1 marca  CHEGG\\domain users 0 Jan 15 13:21 symlink with spaces -> filename with spaces
-rwxr-xr-x  1 marca  CHEGG\\domain users 0 Jan 15 09:39 users
lrwxr-xr-x  1 marca  CHEGG\\domain users 0 Jan 15 09:33 w -> rwx
END

chomp($input);

$expected = <<END;
-rwxr-xr-x  1 marca  CHEGG\\domain users 0 Jan 15 09:41 \e[01;32m09\e[0m
-rwxr-xr-x  1 marca  CHEGG\\domain users 0 Jan 15 09:41 \e[01;32mJan\e[0m
-rwxr-xr-x  1 marca  admin              0 Jan 15 10:25 \e[01;32mJan2\e[0m
-rw-r--r--  1 marca  admin              0 Jan 15 10:27 filename with spaces
-rwxr-xr-x  1 marca  CHEGG\\domain users 0 Jan 15 09:31 \e[01;32mrwx\e[0m
lrwxr-xr-x  1 marca  CHEGG\\domain users 0 Jan 15 13:21 \e[40;34msymlink with spaces\e[0m -> filename with spaces
-rwxr-xr-x  1 marca  CHEGG\\domain users 0 Jan 15 09:39 \e[01;32musers\e[0m
lrwxr-xr-x  1 marca  CHEGG\\domain users 0 Jan 15 09:33 \e[40;34mw\e[0m -> rwx
END

is(`echo "$input" | TAR_COLORS="ln=40;34" bin/tarcolor`, $expected, "tar tvf archive_with_rwx_filename.tgz, TAR_COLORS ln=\"40;34\" set");


$input = <<END;
total 0
-rwxr-xr-x 1 8284 8284  0 Jan 16 06:41 06:41
-rwxr-xr-x 1 8284 8284  0 Jan 16 06:41 06:41 in the morning
drwxr-xr-x 2 8284 8284 68 Jan 14 08:57 directory
-rwxr-xr-x 1 8284 8284  0 Aug  9  2013 executable
prw-r--r-- 1 8284 8284  0 Jan 14 09:01 fifo
-rw-r--r-- 1 8284 8284  0 Jan 14 08:57 normal_file
-rw-r--r-- 1 8284 8284  0 Jan 14 09:48 setgid_file
-rw-r--r-- 1 8284 8284  0 Jan 14 09:47 setuid_file
-rw-r--r-- 1 8284 8284  0 Jan 14 09:17 sticky_file
END

chomp($input);

$expected = <<END;
total 0
-rwxr-xr-x 1 8284 8284  0 Jan 16 06:41 \e[01;32m06:41\e[0m
-rwxr-xr-x 1 8284 8284  0 Jan 16 06:41 \e[01;32m06:41 in the morning\e[0m
drwxr-xr-x 2 8284 8284 68 Jan 14 08:57 \e[01;34mdirectory\e[0m
-rwxr-xr-x 1 8284 8284  0 Aug  9  2013 \e[01;32mexecutable\e[0m
prw-r--r-- 1 8284 8284  0 Jan 14 09:01 \e[40;33mfifo\e[0m
-rw-r--r-- 1 8284 8284  0 Jan 14 08:57 normal_file
-rw-r--r-- 1 8284 8284  0 Jan 14 09:48 setgid_file
-rw-r--r-- 1 8284 8284  0 Jan 14 09:47 setuid_file
-rw-r--r-- 1 8284 8284  0 Jan 14 09:17 sticky_file
END

is(`echo "$input" | TAR_COLORS="ln=40;34" bin/tarcolor`, $expected, "Coloring of pathological ls output");


$input = <<END;
drwxr-xr-x friebel/sysprog   0 2011-11-16 23:42:44 lesspipe-1.72/
-rw-r--r-- friebel/sysprog 11913 2009-07-10 04:34:59 lesspipe-1.72/german.txt
-rwxr-xr-x friebel/sysprog 199875 2009-07-10 04:34:59 lesspipe-1.72/code2color
-rwxr-xr-x friebel/sysprog  11313 2009-07-10 04:34:59 lesspipe-1.72/sxw2txt
-rw-r--r-- friebel/sysprog    524 2011-11-16 23:42:19 lesspipe-1.72/Makefile
-rw-r--r-- friebel/sysprog  17985 2009-07-10 04:34:59 lesspipe-1.72/COPYING
-rwxr-xr-x friebel/sysprog  23126 2011-11-16 23:42:44 lesspipe-1.72/lesspipe.sh
-rw-r--r-- friebel/sysprog   2283 2009-07-15 04:40:48 lesspipe-1.72/TESTCMDS
-rwxr-xr-x friebel/sysprog   2187 2009-07-15 04:28:48 lesspipe-1.72/test.pl
drwxr-xr-x friebel/sysprog      0 2011-11-16 23:27:16 lesspipe-1.72/contrib/
-rw-r--r-- friebel/sysprog    804 2011-11-16 23:27:16 lesspipe-1.72/contrib/less_wrapper
-rw-r--r-- friebel/sysprog    865 2009-07-10 04:34:59 lesspipe-1.72/contrib/enscript.patch
-rw-r--r-- friebel/sysprog   5733 2009-07-10 04:34:59 lesspipe-1.72/contrib/bsdtar.patch
-rw-r--r-- friebel/sysprog   2870 2009-07-10 04:34:59 lesspipe-1.72/contrib/unused.patch
-rwxr-xr-x friebel/sysprog  29149 2011-11-16 22:17:57 lesspipe-1.72/lesspipe.sh.in
-rwxr-xr-x friebel/sysprog  14527 2011-10-17 04:33:55 lesspipe-1.72/configure
-rw-r--r-- friebel/sysprog    701 2009-07-10 04:34:59 lesspipe-1.72/TODO
-rw-r--r-- friebel/sysprog  19268 2011-11-17 00:26:54 lesspipe-1.72/README
-rw-r--r-- friebel/sysprog  11190 2011-11-16 23:28:49 lesspipe-1.72/ChangeLog
-rw-r--r-- friebel/sysprog   5406 2011-11-16 23:35:09 lesspipe-1.72/lesspipe.1
-rw-r--r-- friebel/sysprog   5563 2010-04-06 05:14:51 lesspipe-1.72/INSTALL
drwxr-xr-x friebel/sysprog      0 2011-10-17 07:31:06 lesspipe-1.72/testok/
-rw-r--r-- friebel/sysprog     29 2009-07-10 04:34:59 lesspipe-1.72/testok/a*b.gz
-rw-r--r-- friebel/sysprog   1584 2009-07-10 04:34:59 lesspipe-1.72/testok/test.deb
-rw-r--r-- friebel/sysprog    188 2009-07-10 04:34:59 lesspipe-1.72/testok/a|b.7za
-rw-r--r-- friebel/sysprog  98304 2009-07-10 04:34:59 lesspipe-1.72/testok/iso.image
-rw-r--r-- friebel/sysprog     12 2009-07-10 04:34:59 lesspipe-1.72/testok/test.utf16
-rw-r--r-- friebel/sysprog   2092 2009-07-10 04:34:59 lesspipe-1.72/testok/test.mp3
-rw-r--r-- friebel/sysprog   1374 2009-07-10 04:34:59 lesspipe-1.72/testok/test.rpm
-rw-r--r-- friebel/sysprog      5 2009-07-10 04:34:59 lesspipe-1.72/testok/floppy.txt
-rw-r--r-- friebel/sysprog     29 2009-07-10 04:34:59 lesspipe-1.72/testok/a?b.gz
END

chomp($input);

$expected = <<END;
drwxr-xr-x friebel/sysprog   0 2011-11-16 23:42:44 \e[01;34mlesspipe-1.72/\e[0m
-rw-r--r-- friebel/sysprog 11913 2009-07-10 04:34:59 lesspipe-1.72/german.txt
-rwxr-xr-x friebel/sysprog 199875 2009-07-10 04:34:59 \e[01;32mlesspipe-1.72/code2color\e[0m
-rwxr-xr-x friebel/sysprog  11313 2009-07-10 04:34:59 \e[01;32mlesspipe-1.72/sxw2txt\e[0m
-rw-r--r-- friebel/sysprog    524 2011-11-16 23:42:19 lesspipe-1.72/Makefile
-rw-r--r-- friebel/sysprog  17985 2009-07-10 04:34:59 lesspipe-1.72/COPYING
-rwxr-xr-x friebel/sysprog  23126 2011-11-16 23:42:44 \e[01;32mlesspipe-1.72/lesspipe.sh\e[0m
-rw-r--r-- friebel/sysprog   2283 2009-07-15 04:40:48 lesspipe-1.72/TESTCMDS
-rwxr-xr-x friebel/sysprog   2187 2009-07-15 04:28:48 \e[01;32mlesspipe-1.72/test.pl\e[0m
drwxr-xr-x friebel/sysprog      0 2011-11-16 23:27:16 \e[01;34mlesspipe-1.72/contrib/\e[0m
-rw-r--r-- friebel/sysprog    804 2011-11-16 23:27:16 lesspipe-1.72/contrib/less_wrapper
-rw-r--r-- friebel/sysprog    865 2009-07-10 04:34:59 lesspipe-1.72/contrib/enscript.patch
-rw-r--r-- friebel/sysprog   5733 2009-07-10 04:34:59 lesspipe-1.72/contrib/bsdtar.patch
-rw-r--r-- friebel/sysprog   2870 2009-07-10 04:34:59 lesspipe-1.72/contrib/unused.patch
-rwxr-xr-x friebel/sysprog  29149 2011-11-16 22:17:57 \e[01;32mlesspipe-1.72/lesspipe.sh.in\e[0m
-rwxr-xr-x friebel/sysprog  14527 2011-10-17 04:33:55 \e[01;32mlesspipe-1.72/configure\e[0m
-rw-r--r-- friebel/sysprog    701 2009-07-10 04:34:59 lesspipe-1.72/TODO
-rw-r--r-- friebel/sysprog  19268 2011-11-17 00:26:54 lesspipe-1.72/README
-rw-r--r-- friebel/sysprog  11190 2011-11-16 23:28:49 lesspipe-1.72/ChangeLog
-rw-r--r-- friebel/sysprog   5406 2011-11-16 23:35:09 lesspipe-1.72/lesspipe.1
-rw-r--r-- friebel/sysprog   5563 2010-04-06 05:14:51 lesspipe-1.72/INSTALL
drwxr-xr-x friebel/sysprog      0 2011-10-17 07:31:06 \e[01;34mlesspipe-1.72/testok/\e[0m
-rw-r--r-- friebel/sysprog     29 2009-07-10 04:34:59 lesspipe-1.72/testok/a*b.gz
-rw-r--r-- friebel/sysprog   1584 2009-07-10 04:34:59 lesspipe-1.72/testok/test.deb
-rw-r--r-- friebel/sysprog    188 2009-07-10 04:34:59 lesspipe-1.72/testok/a|b.7za
-rw-r--r-- friebel/sysprog  98304 2009-07-10 04:34:59 lesspipe-1.72/testok/iso.image
-rw-r--r-- friebel/sysprog     12 2009-07-10 04:34:59 lesspipe-1.72/testok/test.utf16
-rw-r--r-- friebel/sysprog   2092 2009-07-10 04:34:59 lesspipe-1.72/testok/test.mp3
-rw-r--r-- friebel/sysprog   1374 2009-07-10 04:34:59 lesspipe-1.72/testok/test.rpm
-rw-r--r-- friebel/sysprog      5 2009-07-10 04:34:59 lesspipe-1.72/testok/floppy.txt
-rw-r--r-- friebel/sysprog     29 2009-07-10 04:34:59 lesspipe-1.72/testok/a?b.gz
END

is(`echo "$input" | TAR_COLORS="ln=40;34" bin/tarcolor`, $expected, "Coloring of ls output with seconds");


$input = <<END;
-rwxrwxrwx  0 0      0        1048 Aug 19  2007 org/mozilla/javascript/xmlimpl/XmlNode\$Filter\$3.class
-rwxrwxrwx  0 0      0         645 Aug 19  2007 org/mozilla/javascript/xmlimpl/XmlNode\$Filter\$4.class
-rwxrwxrwx  0 0      0         579 Aug 19  2007 org/mozilla/javascript/xmlimpl/XmlNode\$Filter\$5.class
-rwxrwxrwx  0 0      0        1271 Aug 19  2007 org/mozilla/javascript/xmlimpl/XmlNode\$Filter.class
-rwxrwxrwx  0 0      0        2392 Aug 19  2007 org/mozilla/javascript/xmlimpl/XmlNode\$List.class
-rwxrwxrwx  0 0      0        2812 Aug 19  2007 org/mozilla/javascript/xmlimpl/XmlNode\$Namespace.class
-rwxrwxrwx  0 0      0        2391 Aug 19  2007 org/mozilla/javascript/xmlimpl/XmlNode\$Namespaces.class
-rwxrwxrwx  0 0      0        4541 Aug 19  2007 org/mozilla/javascript/xmlimpl/XmlNode\$QName.class
-rwxrwxrwx  0 0      0       17493 Aug 19  2007 org/mozilla/javascript/xmlimpl/XmlNode.class
-rwxrwxrwx  0 0      0       11408 Aug 19  2007 org/mozilla/javascript/xmlimpl/XmlProcessor.class
END

chomp($input);

$expected = <<END;
-rwxrwxrwx  0 0      0        1048 Aug 19  2007 \e[01;32morg/mozilla/javascript/xmlimpl/XmlNode\$Filter\$3.class\e[0m
-rwxrwxrwx  0 0      0         645 Aug 19  2007 \e[01;32morg/mozilla/javascript/xmlimpl/XmlNode\$Filter\$4.class\e[0m
-rwxrwxrwx  0 0      0         579 Aug 19  2007 \e[01;32morg/mozilla/javascript/xmlimpl/XmlNode\$Filter\$5.class\e[0m
-rwxrwxrwx  0 0      0        1271 Aug 19  2007 \e[01;32morg/mozilla/javascript/xmlimpl/XmlNode\$Filter.class\e[0m
-rwxrwxrwx  0 0      0        2392 Aug 19  2007 \e[01;32morg/mozilla/javascript/xmlimpl/XmlNode\$List.class\e[0m
-rwxrwxrwx  0 0      0        2812 Aug 19  2007 \e[01;32morg/mozilla/javascript/xmlimpl/XmlNode\$Namespace.class\e[0m
-rwxrwxrwx  0 0      0        2391 Aug 19  2007 \e[01;32morg/mozilla/javascript/xmlimpl/XmlNode\$Namespaces.class\e[0m
-rwxrwxrwx  0 0      0        4541 Aug 19  2007 \e[01;32morg/mozilla/javascript/xmlimpl/XmlNode\$QName.class\e[0m
-rwxrwxrwx  0 0      0       17493 Aug 19  2007 \e[01;32morg/mozilla/javascript/xmlimpl/XmlNode.class\e[0m
-rwxrwxrwx  0 0      0       11408 Aug 19  2007 \e[01;32morg/mozilla/javascript/xmlimpl/XmlProcessor.class\e[0m
END

is(`echo '$input' | TAR_COLORS="ln=40;34" bin/tarcolor`, $expected, "Coloring of GNU tar output for a jar file");


$input = <<END;
drwxr-xr-x  0 friebel sysprog     0 Nov 16 23:42 lesspipe-1.72/
drwxr-xr-x  0 friebel sysprog      0 Nov 16 23:27 lesspipe-1.72/contrib/
drwxr-xr-x  0 friebel sysprog      0 Oct 17 07:31 lesspipe-1.72/testok/
-rw-r--r--  0 friebel sysprog     29 Jul 10  2009 lesspipe-1.72/testok/a*b.gz
-rw-r--r--  0 friebel sysprog   2092 Jul 10  2009 lesspipe-1.72/testok/test.mp3
-rw-r--r--  0 friebel sysprog     29 Jul 10  2009 lesspipe-1.72/testok/a?b.gz
-rw-r--r--  0 friebel sysprog     29 Jul 10  2009 lesspipe-1.72/testok/a]b.gz
-rw-r--r--  0 friebel sysprog   1920 Jul 10  2009 lesspipe-1.72/testok/id3v2.mp3
-rw-r--r--  0 friebel sysprog     35 Jul 10  2009 lesspipe-1.72/testok/a`data.gz
-rw-r--r--  0 friebel sysprog     29 Jul 10  2009 lesspipe-1.72/testok/a[b.gz
-rw-r--r--  0 friebel sysprog     45 Jul 10  2009 lesspipe-1.72/testok/perlstorable.gz
END

chomp($input);

$expected = <<END;
drwxr-xr-x  0 friebel sysprog     0 Nov 16 23:42 \e[01;34mlesspipe-1.72/\e[0m
drwxr-xr-x  0 friebel sysprog      0 Nov 16 23:27 \e[01;34mlesspipe-1.72/contrib/\e[0m
drwxr-xr-x  0 friebel sysprog      0 Oct 17 07:31 \e[01;34mlesspipe-1.72/testok/\e[0m
-rw-r--r--  0 friebel sysprog     29 Jul 10  2009 \e[01;36mlesspipe-1.72/testok/a*b.gz\e[0m
-rw-r--r--  0 friebel sysprog   2092 Jul 10  2009 \e[01;35mlesspipe-1.72/testok/test.mp3\e[0m
-rw-r--r--  0 friebel sysprog     29 Jul 10  2009 \e[01;36mlesspipe-1.72/testok/a?b.gz\e[0m
-rw-r--r--  0 friebel sysprog     29 Jul 10  2009 \e[01;36mlesspipe-1.72/testok/a]b.gz\e[0m
-rw-r--r--  0 friebel sysprog   1920 Jul 10  2009 \e[01;35mlesspipe-1.72/testok/id3v2.mp3\e[0m
-rw-r--r--  0 friebel sysprog     35 Jul 10  2009 \e[01;36mlesspipe-1.72/testok/a`data.gz\e[0m
-rw-r--r--  0 friebel sysprog     29 Jul 10  2009 \e[01;36mlesspipe-1.72/testok/a[b.gz\e[0m
-rw-r--r--  0 friebel sysprog     45 Jul 10  2009 \e[01;36mlesspipe-1.72/testok/perlstorable.gz\e[0m
END

is(`echo '$input' | LS_COLORS='*.mp3=01;35:*.gz=01;36' bin/tarcolor`, $expected, "Color .mp3 files purple and .gz files cyan");


$input = <<END;
drwxr-xr-x 101/10       0 Nov 16 23:42 2011 lesspipe-1.72/
-rw-r--r-- 101/10    5406 Nov 16 23:35 2011 lesspipe-1.72/lesspipe.1
-rwxr-xr-x 101/10   29149 Nov 16 22:17 2011 lesspipe-1.72/lesspipe.sh.in
-rw-r--r-- 101/10   11913 Jul 10 04:34 2009 lesspipe-1.72/german.txt
-rwxr-xr-x 101/10  199875 Jul 10 04:34 2009 lesspipe-1.72/code2color
-rw-r--r-- 101/10     524 Nov 16 23:42 2011 lesspipe-1.72/Makefile
-rwxr-xr-x 101/10    2187 Jul 15 04:28 2009 lesspipe-1.72/test.pl
-rw-r--r-- 101/10   17985 Jul 10 04:34 2009 lesspipe-1.72/COPYING
drwxr-xr-x 101/10       0 Oct 17 07:31 2011 lesspipe-1.72/testok/
-rw-r--r-- 101/10    1584 Jul 10 04:34 2009 lesspipe-1.72/testok/test.deb
-rw-r--r-- 101/10    3482 Jul 10 04:34 2009 lesspipe-1.72/testok/a#rtf
-rw-r--r-- 101/10     188 Jul 10 04:34 2009 lesspipe-1.72/testok/a|b.7za
-rw-r--r-- 101/10     760 Jul 10 04:34 2009 lesspipe-1.72/testok/README
-rw-r--r-- 101/10       5 Jul 10 04:34 2009 lesspipe-1.72/testok/a b
-rw-r--r-- 101/10    1374 Jul 10 04:34 2009 lesspipe-1.72/testok/test.rpm
-rw-r--r-- 101/10      45 Jul 10 04:34 2009 lesspipe-1.72/testok/perlstorable.gz
-rw-r--r-- 101/10    1920 Jul 10 04:34 2009 lesspipe-1.72/testok/id3v2.mp3
-rw-r--r-- 101/10   98304 Jul 10 04:34 2009 lesspipe-1.72/testok/iso.image
-rw-r--r-- 101/10      33 Jul 10 04:34 2009 lesspipe-1.72/testok/a\$b.lz
-rw-r--r-- 101/10    2092 Jul 10 04:34 2009 lesspipe-1.72/testok/test.mp3
-rw-r--r-- 101/10      33 Jul 10 04:34 2009 lesspipe-1.72/testok/a\x5c\x5cb.lz
-rw-r--r-- 101/10      35 Jul 10 04:34 2009 lesspipe-1.72/testok/a`data.gz
-rw-r--r-- 101/10      29 Jul 10 04:34 2009 lesspipe-1.72/testok/a[b.gz
-rw-r--r-- 101/10     219 Jul 10 04:34 2009 lesspipe-1.72/testok/azip.tlz
-rw-r--r-- 101/10       5 Jul 10 04:34 2009 lesspipe-1.72/testok/floppy.txt
-rw-r--r-- 101/10      29 Jul 10 04:34 2009 lesspipe-1.72/testok/a?b.gz
-rwxr-xr-x 101/10     146 Jul 10 04:34 2009 lesspipe-1.72/testok/cabinet.cab
-rw-r--r-- 101/10      29 Jul 10 04:34 2009 lesspipe-1.72/testok/a*b.gz
-rw-r--r-- 101/10      12 Jul 10 04:34 2009 lesspipe-1.72/testok/test.utf16
lrwxrwxrwx 101/10       3 Feb 23 12:32 2012 lesspipe-1.72/testok/symlink symbolic link to a b
-rw-r--r-- 101/10      29 Jul 10 04:34 2009 lesspipe-1.72/testok/a]b.gz
END

chomp($input);

$expected = <<END;
drwxr-xr-x 101/10       0 Nov 16 23:42 2011 \e[01;34mlesspipe-1.72/\e[0m
-rw-r--r-- 101/10    5406 Nov 16 23:35 2011 lesspipe-1.72/lesspipe.1
-rwxr-xr-x 101/10   29149 Nov 16 22:17 2011 \e[01;32mlesspipe-1.72/lesspipe.sh.in\e[0m
-rw-r--r-- 101/10   11913 Jul 10 04:34 2009 lesspipe-1.72/german.txt
-rwxr-xr-x 101/10  199875 Jul 10 04:34 2009 \e[01;32mlesspipe-1.72/code2color\e[0m
-rw-r--r-- 101/10     524 Nov 16 23:42 2011 lesspipe-1.72/Makefile
-rwxr-xr-x 101/10    2187 Jul 15 04:28 2009 \e[01;32mlesspipe-1.72/test.pl\e[0m
-rw-r--r-- 101/10   17985 Jul 10 04:34 2009 lesspipe-1.72/COPYING
drwxr-xr-x 101/10       0 Oct 17 07:31 2011 \e[01;34mlesspipe-1.72/testok/\e[0m
-rw-r--r-- 101/10    1584 Jul 10 04:34 2009 lesspipe-1.72/testok/test.deb
-rw-r--r-- 101/10    3482 Jul 10 04:34 2009 lesspipe-1.72/testok/a#rtf
-rw-r--r-- 101/10     188 Jul 10 04:34 2009 lesspipe-1.72/testok/a|b.7za
-rw-r--r-- 101/10     760 Jul 10 04:34 2009 lesspipe-1.72/testok/README
-rw-r--r-- 101/10       5 Jul 10 04:34 2009 lesspipe-1.72/testok/a b
-rw-r--r-- 101/10    1374 Jul 10 04:34 2009 \e[01;35mlesspipe-1.72/testok/test.rpm\e[0m
-rw-r--r-- 101/10      45 Jul 10 04:34 2009 lesspipe-1.72/testok/perlstorable.gz
-rw-r--r-- 101/10    1920 Jul 10 04:34 2009 lesspipe-1.72/testok/id3v2.mp3
-rw-r--r-- 101/10   98304 Jul 10 04:34 2009 lesspipe-1.72/testok/iso.image
-rw-r--r-- 101/10      33 Jul 10 04:34 2009 lesspipe-1.72/testok/a\$b.lz
-rw-r--r-- 101/10    2092 Jul 10 04:34 2009 lesspipe-1.72/testok/test.mp3
-rw-r--r-- 101/10      33 Jul 10 04:34 2009 lesspipe-1.72/testok/a\x5c\x5cb.lz
-rw-r--r-- 101/10      35 Jul 10 04:34 2009 lesspipe-1.72/testok/a`data.gz
-rw-r--r-- 101/10      29 Jul 10 04:34 2009 lesspipe-1.72/testok/a[b.gz
-rw-r--r-- 101/10     219 Jul 10 04:34 2009 lesspipe-1.72/testok/azip.tlz
-rw-r--r-- 101/10       5 Jul 10 04:34 2009 lesspipe-1.72/testok/floppy.txt
-rw-r--r-- 101/10      29 Jul 10 04:34 2009 lesspipe-1.72/testok/a?b.gz
-rwxr-xr-x 101/10     146 Jul 10 04:34 2009 \e[01;32mlesspipe-1.72/testok/cabinet.cab\e[0m
-rw-r--r-- 101/10      29 Jul 10 04:34 2009 lesspipe-1.72/testok/a*b.gz
-rw-r--r-- 101/10      12 Jul 10 04:34 2009 lesspipe-1.72/testok/test.utf16
lrwxrwxrwx 101/10       3 Feb 23 12:32 2012 \e[01;36mlesspipe-1.72/testok/symlink symbolic link to a b\e[0m
-rw-r--r-- 101/10      29 Jul 10 04:34 2009 lesspipe-1.72/testok/a]b.gz
END

is(`/bin/echo '$input' | TAR_COLORS="ln=01;36:*.rpm=01;35" bin/tarcolor`, $expected, "Coloring of sun tar output");


$input = <<END;
-rwxr-xr-x  1 1505     203            146 Jul 10  2009 lesspipe-1.72/testok/cabinet.cab
-rw-r--r--  1 1505     203          20673 Jul 10  2009 lesspipe-1.72/testok/a b.tgz
-rw-r--r--  1 1505     203            114 Jul 10  2009 lesspipe-1.72/testok/onefile.7za
-rw-r--r--  1 1505     203             35 Jul 10  2009 lesspipe-1.72/testok/a`data.gz
-rw-r--r--  1 1505     203             29 Jul 10  2009 lesspipe-1.72/testok/a[b.gz
-rw-r--r--  1 1505     203            219 Jul 10  2009 lesspipe-1.72/testok/azip.tlz
lrwxrwxrwx  1 1505     203              0 Nov 17 00:28 lesspipe-1.72/testok/symlink => a b
-rw-r--r--  1 1505     203             45 Jul 10  2009 lesspipe-1.72/testok/perlstorable.gz
pax: ustar vol 1, 47 files, 542720 bytes read, 0 bytes written.
END

chomp($input);

$expected = <<END;
-rwxr-xr-x  1 1505     203            146 Jul 10  2009 \e[01;32mlesspipe-1.72/testok/cabinet.cab\e[0m
-rw-r--r--  1 1505     203          20673 Jul 10  2009 lesspipe-1.72/testok/a b.tgz
-rw-r--r--  1 1505     203            114 Jul 10  2009 lesspipe-1.72/testok/onefile.7za
-rw-r--r--  1 1505     203             35 Jul 10  2009 lesspipe-1.72/testok/a`data.gz
-rw-r--r--  1 1505     203             29 Jul 10  2009 lesspipe-1.72/testok/a[b.gz
-rw-r--r--  1 1505     203            219 Jul 10  2009 lesspipe-1.72/testok/azip.tlz
lrwxrwxrwx  1 1505     203              0 Nov 17 00:28 \e[01;36mlesspipe-1.72/testok/symlink => a b\e[0m
-rw-r--r--  1 1505     203             45 Jul 10  2009 lesspipe-1.72/testok/perlstorable.gz
pax: ustar vol 1, 47 files, 542720 bytes read, 0 bytes written.
END

is(`/bin/echo '$input' | TAR_COLORS="ln=01;36:*.rpm=01;35" bin/tarcolor`, $expected, "Coloring of pax output");



$input = <<END;
drwxr-xr-x    4 marca    staff          0 Nov 16 23:42 2011, lesspipe-1.72
-rw-r--r--    1 marca    staff       5406 Nov 16 23:35 2011, lesspipe-1.72/lesspipe.1
-rwxr-xr-x    1 marca    staff      29149 Nov 16 22:17 2011, lesspipe-1.72/lesspipe.sh.in
-rw-r--r--    1 marca    staff      11913 Jul 10 04:34 2009, lesspipe-1.72/german.txt
-rwxr-xr-x    1 marca    staff     199875 Jul 10 04:34 2009, lesspipe-1.72/code2color
-rw-r--r--    1 marca    staff        524 Nov 16 23:42 2011, lesspipe-1.72/Makefile
-rwxr-xr-x    1 marca    staff       2187 Jul 15 04:28 2009, lesspipe-1.72/test.pl
-rw-r--r--    1 marca    staff      17985 Jul 10 04:34 2009, lesspipe-1.72/COPYING
drwxr-xr-x    2 marca    staff          0 Oct 17 07:31 2011, lesspipe-1.72/testok
-rw-r--r--    1 marca    staff       1584 Jul 10 04:34 2009, lesspipe-1.72/testok/test.deb
-rw-r--r--    1 marca    staff       3482 Jul 10 04:34 2009, lesspipe-1.72/testok/a#rtf
-rw-r--r--    1 marca    staff        188 Jul 10 04:34 2009, lesspipe-1.72/testok/a|b.7za
-rw-r--r--    1 marca    staff        760 Jul 10 04:34 2009, lesspipe-1.72/testok/README
-rw-r--r--    1 marca    staff          5 Jul 10 04:34 2009, lesspipe-1.72/testok/a b
-rw-r--r--    1 marca    staff       1374 Jul 10 04:34 2009, lesspipe-1.72/testok/test.rpm
-rw-r--r--    1 marca    staff         45 Jul 10 04:34 2009, lesspipe-1.72/testok/perlstorable.gz
-rw-r--r--    1 marca    staff       1920 Jul 10 04:34 2009, lesspipe-1.72/testok/id3v2.mp3
-rw-r--r--    1 marca    staff      98304 Jul 10 04:34 2009, lesspipe-1.72/testok/iso.image
-rw-r--r--    1 marca    staff         33 Jul 10 04:34 2009, lesspipe-1.72/testok/a\$b.lz
-rw-r--r--    1 marca    staff       2092 Jul 10 04:34 2009, lesspipe-1.72/testok/test.mp3
-rw-r--r--    1 marca    staff         33 Jul 10 04:34 2009, lesspipe-1.72/testok/a\b.lz
-rw-r--r--    1 marca    staff         35 Jul 10 04:34 2009, lesspipe-1.72/testok/a`data.gz
-rw-r--r--    1 marca    staff         29 Jul 10 04:34 2009, lesspipe-1.72/testok/a[b.gz
-rw-r--r--    1 marca    staff        219 Jul 10 04:34 2009, lesspipe-1.72/testok/azip.tlz
-rw-r--r--    1 marca    staff          5 Jul 10 04:34 2009, lesspipe-1.72/testok/floppy.txt
-rw-r--r--    1 marca    staff         29 Jul 10 04:34 2009, lesspipe-1.72/testok/a?b.gz
-rwxr-xr-x    1 marca    staff        146 Jul 10 04:34 2009, lesspipe-1.72/testok/cabinet.cab
-rw-r--r--    1 marca    staff         29 Jul 10 04:34 2009, lesspipe-1.72/testok/a*b.gz
-rw-r--r--    1 marca    staff         12 Jul 10 04:34 2009, lesspipe-1.72/testok/test.utf16
lrwxrwxrwx    1 marca    staff          3 Feb 23 12:32 2012, lesspipe-1.72/testok/symlink -> a b
-rw-r--r--    1 marca    staff         29 Jul 10 04:34 2009, lesspipe-1.72/testok/a]b.gz
-rw-r--r--    1 marca    staff        114 Jul 10 04:34 2009, lesspipe-1.72/testok/onefile.7za
-rw-r--r--    1 marca    staff      20673 Jul 10 04:34 2009, lesspipe-1.72/testok/a b.tgz
-rw-r--r--    1 marca    staff         83 Jul 10 04:34 2009, lesspipe-1.72/testok/test.rar
-rw-r--r--    1 marca    staff       2283 Jul 15 04:40 2009, lesspipe-1.72/TESTCMDS
-rwxr-xr-x    1 marca    staff      11313 Jul 10 04:34 2009, lesspipe-1.72/sxw2txt
-rwxr-xr-x    1 marca    staff      14527 Oct 17 04:33 2011, lesspipe-1.72/configure
-rwxr-xr-x    1 marca    staff      23126 Nov 16 23:42 2011, lesspipe-1.72/lesspipe.sh
-rw-r--r--    1 marca    staff      11190 Nov 16 23:28 2011, lesspipe-1.72/ChangeLog
drwxr-xr-x    2 marca    staff          0 Nov 16 23:27 2011, lesspipe-1.72/contrib
-rw-r--r--    1 marca    staff        865 Jul 10 04:34 2009, lesspipe-1.72/contrib/enscript.patch
-rw-r--r--    1 marca    staff       5733 Jul 10 04:34 2009, lesspipe-1.72/contrib/bsdtar.patch
-rw-r--r--    1 marca    staff        804 Nov 16 23:27 2011, lesspipe-1.72/contrib/less_wrapper
-rw-r--r--    1 marca    staff       2870 Jul 10 04:34 2009, lesspipe-1.72/contrib/unused.patch
-rw-r--r--    1 marca    staff      19268 Nov 17 00:26 2011, lesspipe-1.72/README
-rw-r--r--    1 marca    staff        701 Jul 10 04:34 2009, lesspipe-1.72/TODO
-rw-r--r--    1 marca    staff       5563 Apr  6 05:14 2010, lesspipe-1.72/INSTALL
END

chomp($input);

$expected = <<END;
drwxr-xr-x    4 marca    staff          0 Nov 16 23:42 2011, \e[01;34mlesspipe-1.72\e[0m
-rw-r--r--    1 marca    staff       5406 Nov 16 23:35 2011, lesspipe-1.72/lesspipe.1
-rwxr-xr-x    1 marca    staff      29149 Nov 16 22:17 2011, \e[01;32mlesspipe-1.72/lesspipe.sh.in\e[0m
-rw-r--r--    1 marca    staff      11913 Jul 10 04:34 2009, lesspipe-1.72/german.txt
-rwxr-xr-x    1 marca    staff     199875 Jul 10 04:34 2009, \e[01;32mlesspipe-1.72/code2color\e[0m
-rw-r--r--    1 marca    staff        524 Nov 16 23:42 2011, lesspipe-1.72/Makefile
-rwxr-xr-x    1 marca    staff       2187 Jul 15 04:28 2009, \e[01;32mlesspipe-1.72/test.pl\e[0m
-rw-r--r--    1 marca    staff      17985 Jul 10 04:34 2009, lesspipe-1.72/COPYING
drwxr-xr-x    2 marca    staff          0 Oct 17 07:31 2011, \e[01;34mlesspipe-1.72/testok\e[0m
-rw-r--r--    1 marca    staff       1584 Jul 10 04:34 2009, lesspipe-1.72/testok/test.deb
-rw-r--r--    1 marca    staff       3482 Jul 10 04:34 2009, lesspipe-1.72/testok/a#rtf
-rw-r--r--    1 marca    staff        188 Jul 10 04:34 2009, lesspipe-1.72/testok/a|b.7za
-rw-r--r--    1 marca    staff        760 Jul 10 04:34 2009, lesspipe-1.72/testok/README
-rw-r--r--    1 marca    staff          5 Jul 10 04:34 2009, lesspipe-1.72/testok/a b
-rw-r--r--    1 marca    staff       1374 Jul 10 04:34 2009, \e[01;35mlesspipe-1.72/testok/test.rpm\e[0m
-rw-r--r--    1 marca    staff         45 Jul 10 04:34 2009, lesspipe-1.72/testok/perlstorable.gz
-rw-r--r--    1 marca    staff       1920 Jul 10 04:34 2009, lesspipe-1.72/testok/id3v2.mp3
-rw-r--r--    1 marca    staff      98304 Jul 10 04:34 2009, lesspipe-1.72/testok/iso.image
-rw-r--r--    1 marca    staff         33 Jul 10 04:34 2009, lesspipe-1.72/testok/a\$b.lz
-rw-r--r--    1 marca    staff       2092 Jul 10 04:34 2009, lesspipe-1.72/testok/test.mp3
-rw-r--r--    1 marca    staff         33 Jul 10 04:34 2009, lesspipe-1.72/testok/a\b.lz
-rw-r--r--    1 marca    staff         35 Jul 10 04:34 2009, lesspipe-1.72/testok/a`data.gz
-rw-r--r--    1 marca    staff         29 Jul 10 04:34 2009, lesspipe-1.72/testok/a[b.gz
-rw-r--r--    1 marca    staff        219 Jul 10 04:34 2009, lesspipe-1.72/testok/azip.tlz
-rw-r--r--    1 marca    staff          5 Jul 10 04:34 2009, lesspipe-1.72/testok/floppy.txt
-rw-r--r--    1 marca    staff         29 Jul 10 04:34 2009, lesspipe-1.72/testok/a?b.gz
-rwxr-xr-x    1 marca    staff        146 Jul 10 04:34 2009, \e[01;32mlesspipe-1.72/testok/cabinet.cab\e[0m
-rw-r--r--    1 marca    staff         29 Jul 10 04:34 2009, lesspipe-1.72/testok/a*b.gz
-rw-r--r--    1 marca    staff         12 Jul 10 04:34 2009, lesspipe-1.72/testok/test.utf16
lrwxrwxrwx    1 marca    staff          3 Feb 23 12:32 2012, \e[01;36mlesspipe-1.72/testok/symlink\e[0m -> a b
-rw-r--r--    1 marca    staff         29 Jul 10 04:34 2009, lesspipe-1.72/testok/a]b.gz
-rw-r--r--    1 marca    staff        114 Jul 10 04:34 2009, lesspipe-1.72/testok/onefile.7za
-rw-r--r--    1 marca    staff      20673 Jul 10 04:34 2009, lesspipe-1.72/testok/a b.tgz
-rw-r--r--    1 marca    staff         83 Jul 10 04:34 2009, lesspipe-1.72/testok/test.rar
-rw-r--r--    1 marca    staff       2283 Jul 15 04:40 2009, lesspipe-1.72/TESTCMDS
-rwxr-xr-x    1 marca    staff      11313 Jul 10 04:34 2009, \e[01;32mlesspipe-1.72/sxw2txt\e[0m
-rwxr-xr-x    1 marca    staff      14527 Oct 17 04:33 2011, \e[01;32mlesspipe-1.72/configure\e[0m
-rwxr-xr-x    1 marca    staff      23126 Nov 16 23:42 2011, \e[01;32mlesspipe-1.72/lesspipe.sh\e[0m
-rw-r--r--    1 marca    staff      11190 Nov 16 23:28 2011, lesspipe-1.72/ChangeLog
drwxr-xr-x    2 marca    staff          0 Nov 16 23:27 2011, \e[01;34mlesspipe-1.72/contrib\e[0m
-rw-r--r--    1 marca    staff        865 Jul 10 04:34 2009, lesspipe-1.72/contrib/enscript.patch
-rw-r--r--    1 marca    staff       5733 Jul 10 04:34 2009, lesspipe-1.72/contrib/bsdtar.patch
-rw-r--r--    1 marca    staff        804 Nov 16 23:27 2011, lesspipe-1.72/contrib/less_wrapper
-rw-r--r--    1 marca    staff       2870 Jul 10 04:34 2009, lesspipe-1.72/contrib/unused.patch
-rw-r--r--    1 marca    staff      19268 Nov 17 00:26 2011, lesspipe-1.72/README
-rw-r--r--    1 marca    staff        701 Jul 10 04:34 2009, lesspipe-1.72/TODO
-rw-r--r--    1 marca    staff       5563 Apr  6 05:14 2010, lesspipe-1.72/INSTALL
END

is(`/bin/echo '$input' | TAR_COLORS="ln=01;36:*.rpm=01;35" bin/tarcolor`, $expected, "Coloring of sun cpio output");
