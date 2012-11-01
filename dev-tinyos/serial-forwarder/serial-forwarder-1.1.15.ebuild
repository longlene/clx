# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-tinyos/serial-forwarder/serial-forwarder-1.1.15.ebuild,v 1.3 2010/02/06 11:57:32 ulm Exp $

inherit toolchain-funcs

CVS_MONTH="Dec"
CVS_YEAR="2005"
MY_P="tinyos"

DESCRIPTION="A serial forwarder for TinyOS"
HOMEPAGE="http://www.tinyos.net/"
SRC_URI="http://www.tinyos.net/dist-1.1.0/tinyos/source/${MY_P}-${PV}${CVS_MONTH}${CVS_YEAR}cvs.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND=""
RDEPEND=""
S=${WORKDIR}/${MY_P}-${PV}${CVS_MONTH}${CVS_YEAR}cvs/tools/src/sf

src_compile() {
	$(tc-getCC) ${CFLAGS} -o sf sf.c serialsource.c sfsource.c platform.c || die "sf compile failed"
	$(tc-getCC) ${CFLAGS} -o sflisten sflisten.c sfsource.c platform.c || die "sflisten compile failed"

	# I'm not sure what to do with asf for arm. It seems just sf compiled for arm.
	# But it has no much sense build it if it can't run on the system.
	# If you use this on arm, please contact the maintainer.
}

src_install() {
	exeinto /usr/bin
	doexe sf sflisten  || die "install failed"
}
