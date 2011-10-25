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

######

all: .git atsctrb_jansson.o clean

######

.git:
	rm Makefile README.ATS && git clone $(REMOTE) .

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

cleangit: .git
	rm -r * && git checkout Makefile README.ATS && rm -rf .git .gitignore

###### end of [Makefile] ######
