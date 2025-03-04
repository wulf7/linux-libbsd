# Copyright (c) 2021 Vladimir Kondratyev <vladimir@kondratyev.su>

.if ${MACHINE_ARCH} == "amd64"
CFLAGS+=	-m32
LDFLAGS+=	-m32
LINUXLIBDIR32=	/usr/lib
LINUXLIBDIR=	${LINUXLIBDIR32}
.endif
.include "Makefile.common"
