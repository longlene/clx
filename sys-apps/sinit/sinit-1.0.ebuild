# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="suckless init"
HOMEPAGE="http://git.2f30.org/sinit/"
SRC_URI="http://dl.2f30.org/releases/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i "s/VERSION/${PV}/" ${PN}.8
	sed -i '/LDFLAGS/{s/-s//}' config.mk
}

src_install() {
	dosbin sinit
	doman ${PN}.8
	dodoc README
}
