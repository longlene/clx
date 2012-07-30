# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="web application attack utility"
HOMEPAGE="http://packetstormsecurity.org"
SRC_URI="http://packetstormsecurity.org/UNIX/scanners/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="dev-libs/openssl"
DEPEND="${RDEPEND}"

src_compile() {
	emake || die "emake failed"
}

src_install() {
	dobin hellsing
	dodoc README hellsing.conf
}
