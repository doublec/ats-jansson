This is a [ATS](http://www.ats-lang.org) wrapper for the
[jansson](http://www.digip.org/jansson/) JSON parsing library.  You
can read my post about some of the [implementation decisions
here](http://www.bluishcoder.co.nz/2010/11/23/more-on-type-safety-using-c-and-ats.html).

2013-07-21: Note that the latest version of ATS includes a wrapper for
Jansson in the 'contrib' directory. At some point I'll migrate my
Jansson using libraries to that and deprecate this library.

The library is best used by cloning from under a parent directory that
is used to store ATS libraries. This directory can then be passed to
the 'atscc' command line using the '-I' and '-IATS' options to be
added to the include path. In the examples below this directory is
$ATSCCLIB.

    $ cd $ATSCCLIB
    $ git clone git://github.com/doublec/ats-jansson jansson
    $ cd jansson
    $ make
    $ cd TEST
    $ make

Note that the makefile for the TESTS will build and delete the
tests. If they fail to build - the test failed. To actually build the
executable to run you can specify the test on the make command line:

    $ cd $ATSCCLIB/jansson
    $ make test01
    $ make test02

Comments and suggestions for the wrapper can be made to the author:

    Chris Double
    chris.double@double.co.nz
    http://www.bluishcoder.co.nz
