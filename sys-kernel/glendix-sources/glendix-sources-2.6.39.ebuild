# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

K_SECURITY_UNSUPPORTED="1"
K_DEBLOB_AVAILABLE="1"
ETYPE="sources"
inherit kernel-2
detect_version

DESCRIPTION="Patched sources for the Linux kernel with experimental support for programs  from the  Plan 9 From Bell Labs research operating system."
HOMEPAGE="http://www.glendix.org http://www.kernel.org"
SRC_URI="${KERNEL_URI}"

KEYWORDS="x86"
IUSE="deblob"

src_prepare() {
            epatch "${FILESDIR}/glendix_${PV}.patch"
}
