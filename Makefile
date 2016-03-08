.SUFFIXES: .md .3.gz

LIB 	= libpov.a
SRCS 	= $(wildcard src/*.c lib/*.c)
OBJS 	= $(SRCS:.c=.o)
DOC_SRC	= $(wildcard *.md)
DOCS	= $(DOC_SRC:.md=.3.gz)


LIBDIR	= $(DESTDIR)/usr/lib
INCDIR	= $(DESTDIR)/usr/include
MANDIR	= $(DESTDIR)/usr/share/man/man3

AR_FLAGS = cru
CFLAGS  = -c -Wall -Wextra -pedantic -DNPATCHED -nostdlib -fno-builtin -nostdinc -Iinclude -Ilib -I/usr/include -g -O0 -Wno-overlength-strings -Wno-packed -Wno-unused-function

CC = /usr/i386-linux-cgc/bin/clang
LD = /usr/i386-linux-cgc/bin/ld
AR = /usr/i386-linux-cgc/bin/ar

%.3.gz: %.md
	pandoc -s -t man $< | gzip -9 > $@

$(LIB): $(OBJS)
	$(AR) $(AR_FLAGS) $@ $^

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

all: $(LIB) $(DOCS)

install: all
	install -d $(LIBDIR)
	install $(LIB) $(LIBDIR)

	install -d $(INCDIR)
	install include/*.h $(INCDIR)

	install -d $(INCDIR)/pov
	install include/pov/*.h $(INCDIR)/pov

	install -d $(MANDIR)
	install -m 444 $(DOCS) $(MANDIR)

clean:
	rm -f $(OBJS) $(LIB) $(DOCS)
