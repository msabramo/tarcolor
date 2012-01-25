#!/usr/bin/perl

use warnings;
use strict;

use Test::More;

plan tests => 11;

my $expected = <<END;
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

is(`tar tvf t/test_tar_archive.tgz | bin/tarcolor`, $expected, "tar tvf test_tar_archive.tgz, no TAR_COLORS set");

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

is(`gtar tvf t/test_tar_archive.tgz 2> /dev/null | bin/tarcolor`, $expected, "gtar tvf test_tar_archive.tgz, no TAR_COLORS set");

$expected = <<END;
drwxr-xr-x  0 marc   marc        0 Jan 27  2011 \e[01;34mtest_archive/\e[0m
drwxr-xr-x  0 marc   marc        0 Jan 27  2011 \e[01;34mtest_archive/dir/\e[0m
-rwxr-xr-x  0 marc   marc        0 Jan 27  2011 \e[01;32mtest_archive/executable\e[0m
lrwxr-xr-x  0 marc   marc        0 Jan 27  2011 \e[01;36mtest_archive/link\e[0m -> executable
END

is(`tar tvf t/test_archive.tar.gz | bin/tarcolor`, $expected, "tar tvf test_archive.tar.gz, no TAR_COLORS set");

$expected = <<END;
drwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;34mtest_archive/\e[0m
drwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;34mtest_archive/dir/\e[0m
-rwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;32mtest_archive/executable\e[0m
lrwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;36mtest_archive/link\e[0m -> executable
END

is(`gtar tvf t/test_archive.tar.gz | bin/tarcolor`, $expected, "gtar tvf test_archive.tar.gz, no TAR_COLORS set");

$expected = <<END;
drwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;33mtest_archive/\e[0m
drwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;33mtest_archive/dir/\e[0m
-rwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;32mtest_archive/executable\e[0m
lrwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;36mtest_archive/link\e[0m -> executable
END

is(`gtar tvf t/test_archive.tar.gz | TAR_COLORS="di=01;33" bin/tarcolor`, $expected, "gtar tvf test_archive.tar.gz, TAR_COLORS di=\"01;33\" set");

$expected = <<END;
drwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;34mtest_archive/\e[0m
drwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;34mtest_archive/dir/\e[0m
-rwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;33mtest_archive/executable\e[0m
lrwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;36mtest_archive/link\e[0m -> executable
END

is(`gtar tvf t/test_archive.tar.gz | TAR_COLORS="ex=01;33" bin/tarcolor`, $expected, "gtar tvf test_archive.tar.gz, TAR_COLORS ex=\"01;33\" set");

$expected = <<END;
drwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;34mtest_archive/\e[0m
drwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;34mtest_archive/dir/\e[0m
-rwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;32mtest_archive/executable\e[0m
lrwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;33mtest_archive/link\e[0m -> executable
END

is(`gtar tvf t/test_archive.tar.gz | TAR_COLORS="ln=01;33" bin/tarcolor`, $expected, "gtar tvf test_archive.tar.gz, TAR_COLORS ln=\"01;33\" set");

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

is(`gtar tvf t/archive_with_rwx_filename.tgz 2> /dev/null | TAR_COLORS="ln=40;34" bin/tarcolor`, $expected, "gtar tvf archive_with_rwx_filename.tgz, TAR_COLORS ln=\"40;34\" set");

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

is(`tar tvf t/archive_with_rwx_filename.tgz 2> /dev/null | TAR_COLORS="ln=40;34" bin/tarcolor`, $expected, "tar tvf archive_with_rwx_filename.tgz, TAR_COLORS ln=\"40;34\" set");

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

is(`cat t/ls_output | TAR_COLORS="ln=40;34" bin/tarcolor`, $expected, "Coloring of pathological ls output");

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

is(`cat t/ls_output_with_seconds | TAR_COLORS="ln=40;34" bin/tarcolor`, $expected, "Coloring of ls output with seconds");

