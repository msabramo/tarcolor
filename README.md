# tarcolor

A Perl program that can color the output of `tar tvf` (tested with [bsdtar](http://code.google.com/p/libarchive/) 2.6.2 and [GNU tar](http://www.gnu.org/software/tar/) 1.26 on OS X 10.6.8) similarly to the way `ls` would

By Marc Abramowitz [http://marc-abramowitz.com](http://marc-abramowitz.com)


## Installation

Download a tarball App-TarColor-<version>.tar.gz from [the downloads page](https://github.com/msabramo/tarcolor/downloads).

Or build a tarball from the repository:

	$ dzil build

Install with cpanm:

	$ cpanm App-TarColor-0.001.tar.gz

Or untar the tarball and build it:

	$ tar xzf App-TarColor-<version>.tar.gz
	$ cd App-TarColor-<version>
    $ perl Makefile.PL
    $ make && make test

Then install it:

    $ make install

If you are installing into a system-wide directory, you may need to run:

    $ sudo make install


## Example

![tarcolor screenshot](https://github.com/msabramo/tarcolor/raw/master/tarcolor_screenshot.png "tarcolor screenshot")


## Future enhancements (patches are welcome!)

* Send me your ideas (especially with patches!)
