# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Command line static HTTP server"
HOMEPAGE="https://github.com/SuperPaintman/serve"
SRC_URI="https://github.com/SuperPaintman/serve/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-lang/crystal
	dev-util/shards
"
RDEPEND="${DEPEND}"

src_install() {
	dobin bin/serve
	dodoc README.md
}
