# tarcolor

A Perl program that can color the output of `tar tvf` (tested with [bsdtar](http://code.google.com/p/libarchive/) 2.6.2 and [GNU tar](http://www.gnu.org/software/tar/) 1.26 on OS X 10.6.8) similarly to the way `ls` would

By Marc Abramowitz (http://marc-abramowitz.com)


## Installation

Download a tarball `App-TarColor-<version>.tar.gz` from [the downloads page](https://github.com/msabramo/tarcolor/downloads).

Or build a tarball from the repository using [Dist::Zilla](http://dzil.org/):

    $ dzil build

Install from the tarball with [cpanm (a.k.a.: App::cpanminus)](http://search.cpan.org/perldoc?cpanm):

    $ cpanm App-TarColor-<version>.tar.gz

Or untar the tarball and build it:

    $ tar xzf App-TarColor-<version>.tar.gz
    $ cd App-TarColor-<version>
    $ perl Makefile.PL
    $ make && make test

Then install it:

    $ make install

If you are installing into a system-wide directory, you may need to run:

    $ sudo make install


## Usage

You can use `tarcolor` manually like this:

	$ tar tvf some_tarball.tgz | tarcolor

There is also a bundled shell script (for bash and zsh) that makes `tar`
automatically pipe its output through `tarcolor`:

    $ source /usr/local/etc/tarcolor/tarcolorauto.sh
    $ tarcolorauto on
	$ tar tvf some_tarball.tgz
    ... colored output ...
    $ tarcolorauto off
	$ tar tvf some_tarball.tgz
    ... normal uncolored output ...


## Customization

Colors can be customized using the `LS_COLORS` or `TAR_COLORS` environment variables:

    $ export TAR_COLORS='di=01;34:ln=01;36:ex=01;32:so=01;40:pi=01;40:bd=40;33:cd=40;33:su=0;41:sg=0;46'

The format for `LS_COLORS` and `TAR_COLORS` is the same format used by `LS_COLORS` (used by [GNU ls](http://www.gnu.org/software/coreutils/manual/html_node/ls-invocation.html#ls-invocation)). So if you use GNU ls and have your `LS_COLORS` set, then tarcolor will use similar colors as ls.


## Example

![tarcolor screenshot](https://github.com/msabramo/tarcolor/raw/master/tarcolor_screenshot.png "tarcolor screenshot")


## Future enhancements (patches are welcome!)

* Send me your ideas (especially with patches!)
