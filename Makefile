CFLAGS+=-g -std=c11 -Wall -Wextra -I/usr/local/include 
LDFLAGS+=-L/usr/local/lib -lxcb #-lxcb-keysyms -lxcb-icccm -lxcb-util

RM=/bin/rm
PREFIX=/usr/local

TARGETS=monocles 
OBJS=monocles.o 

all: $(TARGETS)

monocles: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) $(LDFLAGS) -o $@

monocles.o: monocles.c 
#config.h Makefile

install: $(TARGETS)
	install -m 755 monocles $(PREFIX)/bin

uninstall: deinstall
deinstall:
	$(RM) $(PREFIX)/bin/monocles

clean:
	$(RM) -f $(TARGETS) *.o
