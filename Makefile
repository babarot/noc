PREFIX     ?= /usr/local
MKPATH     ?= mkdir -p
INSTALL    ?= install
INSTALLBIN ?= ${INSTALL} -m 555
INSTALLMAN ?= ${INSTALL} -m 444
CC     := gcc
CFLAGS := -O2 -Wall
EXEC   := noc
PROG   := noc.c
RM     := rm -f

build: $(EXEC)

$(EXEC): $(PROG)
	$(CC) $(CFLAGS) -o $@ $?

uninstall:
	$(RM) ${PREFIX}/bin/noc
	$(RM) ${PREFIX}/share/man/man1/noc.1

install: $(EXEC)
	${MKPATH} ${PREFIX}/bin
	${INSTALLBIN} noc ${PREFIX}/bin/noc
	${MKPATH} ${PREFIX}/share/man/man1
	${INSTALLMAN} noc.1 ${PREFIX}/share/man/man1/noc.1

.PHONY: all install uninstall build
