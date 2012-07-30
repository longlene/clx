# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion

DESCRIPTION="FreeWRT ADK"
HOMEPAGE="http://www.freewrt.org"
SRC_URI=""
ESVN_REPO_URI="http://www.freewrt.org/svn/tags/${PN}_${PV//./_}"

LICENSE="FreeWRT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="app-arch/unzip
	app-arch/gzip
	app-arch/bzip2
	dev-lang/perl
	sys-apps/ed
    sys-devel/binutils
	sys-devel/bison
	sys-devel/flex
	sys-devel/make
	sys-devel/patch
	sys-libs/ncurses
	sys-libs/zlib"
DEPEND=${RDEPEND}

S=${WORKDIR}/${MY_S}
TARGET="/usr/src/${P}"

src_install()
{
	dodoc README
	dodoc docs/handbook/devel/kbuild/Config.in-structure.txt

	dodir ${TARGET}
	cp -pR ${S}/* ${D}${TARGET}/
}

src_compile()
{
	return
}

pkg_postinst()
{
	elog "Usage:"
	elog "	- Change directory to ${TARGET}"
	elog "	- Call \"make menuconfig && make\" to configure and build the custom FreeWRT image"
	elog " "
	elog "For further details see the handbook at"
	elog "	http://www.freewrt.org/docs/1.0/handbook/html-single/index.html"
}
