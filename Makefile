CC=gcc
CFLAGS =  -g -Wall -O2 -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
OBJS=mumudvb 

INCS=-I ../DVB/include -I /usr/src/linux/include

ifdef UK
  CFLAGS += -DUK
endif

ifdef FINLAND
  CFLAGS += -DFINLAND
endif

ifdef FINLAND2
  CFLAGS += -DFINLAND2
endif

ifdef FRANCE
  CFLAGS += -DFRANCE
endif

all: $(OBJS)

mumudvb: mumudvb.c tune.o udp.o dvb.o
	$(CC) $(INCS) $(CFLAGS) -o mumudvb mumudvb.c tune.o udp.o dvb.o

tune.o: tune.c tune.h dvb_defaults.h
	$(CC) $(INCS) $(CFLAGS) -c -o tune.o tune.c

udp.o: udp.c udp.h
	$(CC) $(INCS) $(CFLAGS) -c -o udp.o udp.c

dvb.o: dvb.c dvb.h
	$(CC) $(INCS) $(CFLAGS) -c -o dvb.o dvb.c

clean:
	rm -f  *.o *~ $(OBJS)

clean_objs:
	rm -f  *.o *~