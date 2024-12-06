# Copyright (c) 2021 Vladimir Kondratyev <vladimir@kondratyev.su>
.include "../Makefile.sysdir"

LINUXDIR?=	/compat/linux
INCSGROUPS=	ROOT RSYS

SYSAUTO=	sys/event.h sys/tree.h

ROOT=		bsd.h
RSYS=		sys/bsd.h
RSYS+=		${SYSAUTO}

ROOTDIR=	${LINUXDIR}/usr/include
RSYSDIR=	${ROOTDIR}/sys
CLEANFILES=	${SYSAUTO}

sys/event.h sys/tree.h:
	sed -e 's|<sys/_types\.h>|<stdint.h>|' \
		-e 's|<sys/cdefs\.h>|<stdint.h>|' \
		-e 's|__uintptr_t|uintptr_t|g' ${SYSDIR}/$@ > $@

.include <bsd.prog.mk>
