# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# some of these can be ommitted once we find out wich ones are needed
inherit eutils toolchain-funcs flag-o-matic

DESCRIPTION="A command line program to access an EMS USB memory card / adapter \
for the Nintendo Gamecube."
HOMEPAGE="http://www.wongr.net/emslink/"
SRC_URI="http://www.wongr.net/emslink/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~sparc ~mips ~ppc ~ia64"

DEPEND=">=dev-libs/libusb-0.1.12"
RDEPEND=${DEPEND}

src_compile() {
	econf || die "econf failed"
	emake DESTDIR=$"{D}" install || die "install failed"
}

src_install() {
	dobin emslink || die
	dodoc README* README.txt
}
