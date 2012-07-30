# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="fast SSL port scanner"
HOMEPAGE="http://www.titania.co.uk/sslscan.php"
SRC_URI="mirror://sourceforge/sslscan/${P}.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""

src_compile() {
	emake || die "emake failed"
}

src_install() {
	dobin sslscan
	doman sslscan.1
	dodoc Changelog
}
