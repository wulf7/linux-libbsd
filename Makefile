# Copyright (c) 2021 Vladimir Kondratyev <vladimir@kondratyev.su>

SUBDIR+=kmod
SUBDIR+=include
.ifndef NO_LIB32
SUBDIR+=lib
.endif
.if ${MACHINE_ARCH} == "amd64"
SUBDIR+=lib64
.endif

.include <bsd.subdir.mk>
