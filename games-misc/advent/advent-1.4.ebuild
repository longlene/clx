# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Colossal Cave Adventure"
HOMEPAGE="http://www.catb.org/~esr/open-adventure/"
SRC_URI="http://www.catb.org/~esr/open-adventure/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/libedit
	dev-python/pyyaml
"
RDEPEND="${DEPEND}"

src_install() {
	dobin advent
	doman advent.6
}
