# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

#inherit perl-module toolchain-funcs

DESCRIPTION="easy object serialization in C++"
HOMEPAGE="http://s11n.sourceforge.net"
SRC_URI="mirror://sourceforge/s11n/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
#KEYWORDS="~amd64 ~sparc"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_compile() {
	econf
	emake || die "emake failed."
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
}
