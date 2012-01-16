#!/usr/bin/perl

use warnings;
use strict;

use Test::More;

plan tests => 10;

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

is(`tar tvf t/test_tar_archive.tgz | ./tarcolor.pl`, $expected, "tar tvf test_tar_archive.tgz, no TAR_COLORS set");

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

is(`gtar tvf t/test_tar_archive.tgz 2> /dev/null | ./tarcolor.pl`, $expected, "gtar tvf test_tar_archive.tgz, no TAR_COLORS set");

$expected = <<END;
drwxr-xr-x  0 marc   marc        0 Jan 27  2011 \e[01;34mtest_archive/\e[0m
drwxr-xr-x  0 marc   marc        0 Jan 27  2011 \e[01;34mtest_archive/dir/\e[0m
-rwxr-xr-x  0 marc   marc        0 Jan 27  2011 \e[01;32mtest_archive/executable\e[0m
lrwxr-xr-x  0 marc   marc        0 Jan 27  2011 \e[01;36mtest_archive/link\e[0m -> executable
END

is(`tar tvf t/test_archive.tar.gz | ./tarcolor.pl`, $expected, "tar tvf test_archive.tar.gz, no TAR_COLORS set");

$expected = <<END;
drwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;34mtest_archive/\e[0m
drwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;34mtest_archive/dir/\e[0m
-rwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;32mtest_archive/executable\e[0m
lrwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;36mtest_archive/link\e[0m -> executable
END

is(`gtar tvf t/test_archive.tar.gz | ./tarcolor.pl`, $expected, "gtar tvf test_archive.tar.gz, no TAR_COLORS set");

$expected = <<END;
drwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;33mtest_archive/\e[0m
drwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;33mtest_archive/dir/\e[0m
-rwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;32mtest_archive/executable\e[0m
lrwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;36mtest_archive/link\e[0m -> executable
END

is(`gtar tvf t/test_archive.tar.gz | TAR_COLORS="di=01;33" ./tarcolor.pl`, $expected, "gtar tvf test_archive.tar.gz, TAR_COLORS di=\"01;33\" set");

$expected = <<END;
drwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;34mtest_archive/\e[0m
drwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;34mtest_archive/dir/\e[0m
-rwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;33mtest_archive/executable\e[0m
lrwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;36mtest_archive/link\e[0m -> executable
END

is(`gtar tvf t/test_archive.tar.gz | TAR_COLORS="ex=01;33" ./tarcolor.pl`, $expected, "gtar tvf test_archive.tar.gz, TAR_COLORS ex=\"01;33\" set");

$expected = <<END;
drwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;34mtest_archive/\e[0m
drwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;34mtest_archive/dir/\e[0m
-rwxr-xr-x marc/marc         0 2011-01-27 09:00 \e[01;32mtest_archive/executable\e[0m
lrwxr-xr-x marc/marc         0 2011-01-27 09:01 \e[01;33mtest_archive/link\e[0m -> executable
END

is(`gtar tvf t/test_archive.tar.gz | TAR_COLORS="ln=01;33" ./tarcolor.pl`, $expected, "gtar tvf test_archive.tar.gz, TAR_COLORS ln=\"01;33\" set");

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

is(`gtar tvf t/archive_with_rwx_filename.tgz 2> /dev/null | TAR_COLORS="ln=40;34" ./tarcolor.pl`, $expected, "gtar tvf archive_with_rwx_filename.tgz, TAR_COLORS ln=\"40;34\" set");

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

is(`tar tvf t/archive_with_rwx_filename.tgz 2> /dev/null | TAR_COLORS="ln=40;34" ./tarcolor.pl`, $expected, "tar tvf archive_with_rwx_filename.tgz, TAR_COLORS ln=\"40;34\" set");

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

is(`cat t/ls_output | TAR_COLORS="ln=40;34" ./tarcolor.pl`, $expected, "Coloring of pathological ls output");

