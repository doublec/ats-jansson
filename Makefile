#
# API for Jannson in ATS
#
# Author: Chris Double (chris DOT double AT double DOT co DOT nz)
# Time: November, 2010
#

######
REMOTE=http://github.com/doublec/ats-jansson
ATSHOMEQ="$(ATSHOME)"
ATSCC=$(ATSHOMEQ)/bin/atscc -Wall
CFLAGS=`pkg-config jansson --cflags`
ATSCCLIB=$(shell pwd)/..

######

all: atsctrb_jansson.o clean

######

atsctrb_jansson.o: jansson_dats.o
	ld -r -o $@ jansson_dats.o

######

jansson_dats.o: DATS/jansson.dats
	$(ATSCC) -I$(ATSCCLIB) -IATS$(ATSCCLIB) $(CFLAGS) -o $@ -c DATS/jansson.dats

######

clean::
	rm -f *_?ats.c *_?ats.o

cleanall: clean
	rm -f atsctrb_jansson.o

###### end of [Makefile] ######
