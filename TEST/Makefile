######

ATSHOMEQ="$(ATSHOME)"
ATSCC=$(ATSHOMEQ)/bin/atscc
ATSCCLIB=$(shell pwd)/../..
ATSCTRB=\
  $(ATSCCLIB)/jansson/atsctrb_jansson.o
CFLAGS=`pkg-config jansson --cflags`
LIBS=`pkg-config jansson --libs`
######

checkall: compall cleanall

######

compall: \
  test01 \
  test02

######

test01: jansson-test01.dats
	$(ATSCC) -I$(ATSCCLIB) -IATS$(ATSCCLIB) $(CFLAGS) -o test01 \
          jansson-test01.dats $(ATSCTRB) $(LIBS)

test02: jansson-test02.dats
	$(ATSCC) -I$(ATSCCLIB) -IATS$(ATSCCLIB) $(CFLAGS) -o test02 \
          jansson-test02.dats $(ATSCTRB) $(LIBS)


######

clean:
	rm -f *_?ats.c *.o *~

cleanall: clean
	rm -f test01
	rm -f test02

###### end of [Makefile] ######
