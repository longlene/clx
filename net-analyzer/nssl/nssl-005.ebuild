# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit base eutils

MY_SRC_P="${PN}.${PV}"
S=${WORKDIR}/${PN}

DESCRIPTION="Netcat-like program with transparent Secure Socket Layer support"
HOMEPAGE="http://sourceforge.net/projects/nssl"
SRC_URI="mirror://sourceforge/nssl/${MY_SRC_P}.tgz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/openssl"
RDEPEND=${DEPEND}

src_compile() {
	emake || die "make failed"	
}

src_install() {
	dobin nssl
	dodoc readme.txt 
}
