#MACROS
SHELL=/bin/sh
CC=bash
INCLUDES=
OBJS= commits
FILE=

out.o:${OBJS}
	 chmod +x ${OBJS} && ${CC} ${OBJS}

install:${OBJS}
	cp ${OBJS} /usr/bin
