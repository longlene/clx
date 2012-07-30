# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

inherit toolchain-funcs

DESCRIPTION="console-tool to set parameters of a Video4Linux-device"
HOMEPAGE="http://www.vanheusden.com/dov4l/"
SRC_URI="http://www.vanheusden.com/dov4l/${P}.tgz"
LICENSE="GPL-1 GPL-2"
SLOT="0"

KEYWORDS="amd64 ppc x86 ~arm"

IUSE=""
RDEPEND=""

DEPEND="${RDEPEND}
	sys-kernel/linux-headers"

src_compile() {
	tc-export CC
	emake CPPFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" || die "emake failed"
}

src_install() {
	exeinto /usr/bin
	doexe dov4l || die "install failed"
	doman dov4l.1
}
