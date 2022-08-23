#MACROS
SHELL=/bin/sh
CC=bash
INCLUDES=
OBJS= commits.sh
FILE=

out.o:${OBJS}
	 chmod +x ${OBJS} && ${CC} ${OBJS}
