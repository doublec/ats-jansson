#
# API for Jannson in ATS
#
# Author: Chris Double (chris DOT double AT double DOT co DOT nz)
# Time: November, 2010
#

######

ATSHOMEQ="$(ATSHOME)"
ATSCC=$(ATSHOMEQ)/bin/atscc -Wall
JANSSONCFLAGS=`pkg-config jansson --cflags`

######

all: atsctrb_jansson.o clean

######

atsctrb_jansson.o: jansson_dats.o
	ld -r -o $@ jansson_dats.o

######

jansson_dats.o: DATS/jansson.dats
	$(ATSCC) $(XRCFLAGS) -o $@ -c DATS/jansson.dats

######

clean::
	rm -f *_?ats.c *_?ats.o

cleanall: clean
	rm -f atsctrb_jansson.o

###### end of [Makefile] ######
