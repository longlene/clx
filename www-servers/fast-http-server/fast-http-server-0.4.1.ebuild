# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="Super fast, zero configuration command line HTTP Server"
HOMEPAGE="https://github.com/sdogruyol/fast-http-server"
SRC_URI="https://github.com/sdogruyol/fast-http-server/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
#KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/crystal"
RDEPEND="${DEPEND}"

src_compile() {
	crystal build --release src/${PN}.cr || die "compile error"
}

src_install() {
	dobin fast-http-server
	dodoc README.md
}
