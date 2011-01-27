<style type="text/css">
.dir   { color: blue; font-weight: bold }
.exec  { color: green; font-weight: bold }
.link  { color: cyan; font-weight: bold }
</style>

# tarcolor
Perl program that can color output of `tar tvf` similarly to the way ls would

By Marc Abramowitz [http://marc-abramowitz.com](http://marc-abramowitz.com)

## Installation

<pre>
$ cp tarcolor.pl ~/bin/tarcolor
</pre>

## Example

<pre>
$ tar tvzf test_archive.tar.gz | tarcolor
drwxr-xr-x  0 marc   marc        0 Jan 27 09:01 <span class="dir">test_archive</span>/
drwxr-xr-x  0 marc   marc        0 Jan 27 09:00 <span class="dir">test_archive/dir/</span>
-rwxr-xr-x  0 marc   marc        0 Jan 27 09:00 <span class="exec">test_archive/executable</span>
lrwxr-xr-x  0 marc   marc        0 Jan 27 09:01 <span class="link">test_archive/link</span> -> executable
</pre>
