# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/ta2gch/iris"
EGIT_COMMIT="526f28ddf030c626f8a2000baf1bb785ca2c6faf"

DESCRIPTION="a interpreter of ISLisp implemented with golang"
HOMEPAGE="https://github.com/ta2gch/iris"
SRC_URI="https://github.com/ta2gch/iris/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin iris
	dodoc src/${EGO_PN}/README.md
}
