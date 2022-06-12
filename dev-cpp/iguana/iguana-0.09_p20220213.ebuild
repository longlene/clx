# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="59e3fb530d475f873cbb5ba240e9b12f062850a8"

DESCRIPTION="universal serialization engine"
HOMEPAGE="https://github.com/qicosmos/iguana"
SRC_URI="https://github.com/qicosmos/iguana/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r iguana
	dodoc README.md
}
