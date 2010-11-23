######

ATSHOMEQ="$(ATSHOME)"
ATSCC=$(ATSHOMEQ)/bin/atscc
ATSCTRB=\
  $(ATSHOMEQ)/contrib/jansson/atsctrb_jansson.o
JANSSONCFLAGS=`pkg-config jansson --cflags`
JANSSONLIBS=`pkg-config jansson --libs`
######

checkall: compall cleanall

######

compall: \
  test01 \
  test02

######

test01: jansson-test01.dats
	$(ATSCC) $(JANSSONCFLAGS) -o test01 \
          jansson-test01.dats $(ATSCTRB) $(JANSSONLIBS)

test02: jansson-test02.dats
	$(ATSCC) $(JANSSONCFLAGS) -o test02 \
          jansson-test02.dats $(ATSCTRB) $(JANSSONLIBS)


######

clean:
	rm -f *_?ats.c *.o *~

cleanall: clean
	rm -f test01
	rm -f test02

###### end of [Makefile] ######
