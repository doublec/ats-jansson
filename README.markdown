This is a [ATS](http://www.ats-lang.org) wrapper for the [jansson](http://www.digip.org/jansson/) JSON parsing library.  You can read my post about some of the [implementation decisions here](http://www.bluishcoder.co.nz/2010/11/23/more-on-type-safety-using-c-and-ats.html).

The library is best used by cloning from under the $ATSHOME/contrib directory. From there you can run 'make' from the janson directory and the jansson/TESTS directory.

    $ cd $ATSHOME/contrib
    $ git clone git://github.com/doublec/ats-jansson
    $ cd jansson
    $ make
    $ cd TESTS
    $ make

Note that the makefile for the TESTS will build and delete the tests. If they fail to build - the test failed. To actually build the executable to run you can specify the test on the make command line:

    $ cd $ATSHOME/contrib/jansson
    $ make test01
    $ make test02

Comments and suggestions for the wrapper can be made to the author:

    Chris Double
    chris.double@double.co.nz
    http://www.bluishcoder.co.nz
