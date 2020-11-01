# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

DESCRIPTION="header-only library for asyncronous communication with PostgreSQL"
HOMEPAGE="https://github.com/yandex/ozo"
SRC_URI="https://github.com/yandex/ozo/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="PostgreSQL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-db/postgresql
	dev-db/resource_pool
"

src_install() {
	insinto /usr/include
	doins -r include ozo
	dodoc README.md
}
