# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="33d1aa06cf6b22e138921eb969873c25f2b3061d"

DESCRIPTION="header-only library for asyncronous communication with PostgreSQL"
HOMEPAGE="https://github.com/yandex/ozo"
SRC_URI="https://github.com/yandex/ozo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="PostgreSQL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-db/postgresql
	dev-cpp/resource_pool
"

src_install() {
	insinto /usr/include
	doins -r include ozo
	dodoc README.md
}
