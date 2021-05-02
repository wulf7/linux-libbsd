# Copyright (c) 2021 Vladimir Kondratyev <vladimir@kondratyev.su>

SUBDIR+=kmod
SUBDIR+=include
SUBDIR+=lib
.if ${MACHINE_ARCH} == "amd64"
SUBDIR+=lib64
.endif

.include <bsd.subdir.mk>
