# Copyright (c) 2021 Vladimir Kondratyev <vladimir@kondratyev.su>
.include "../Makefile.sysdir"

LIB=		bsd

LINUXDIR?=	/compat/linux

AUTOSRCS=	devname.c		\
		strlcat.c		\
		strlcpy.c		\
		sysctlbyname.c		\
		sysctlnametomib.c
SRCS=		kevent.c		\
		kqueue.c
SRCS+=		${AUTOSRCS}
.if ${OSVERSION} >= 1300045
SRCS+=		__sysctlbyname.c
.endif

CC=		${LINUXDIR}/usr/bin/gcc
CFLAGS+=	--sysroot ${LINUXDIR}
CFLAGS+=	-I${.CURDIR}/../include -include bsd.h
.if ${MACHINE_ARCH} == "amd64" && !empty(${SFX})
CFLAGS+=	-m32
LDFLAGS+=	-m32
.endif

LIBDIR=		${LINUXDIR}/usr/lib${SFX}
SHLIB_MAJOR=	1

CLEANFILES=	${AUTOSRCS} param.h sysctl.h
LIBCDIR=	${SYSDIR}/../lib/libc

# Add some FreeBSD constants to Linux sys/param.h
param.h:
	echo "#include <sys/param.h>" > $@
	grep 'SPECNAMELEN' ${SYSDIR}/sys/$@ >> $@

strlcpy.c strlcat.c:
	${CP} ${LIBCDIR}/string/$@ $@

# sysctlnametomib requires sys/sysctl.h from FreeBSD to work
sysctl.h:
	${CP} ${SYSDIR}/sys/$@ $@

devname.c sysctlbyname.c sysctlnametomib.c: param.h sysctl.h
	sed -e 's|<sys/sysctl\.h>|"sysctl.h"|' \
	    -e 's|<sys/param\.h>|"param.h"|' \
		${LIBCDIR}/gen/$@ > $@

.include <bsd.lib.mk>
