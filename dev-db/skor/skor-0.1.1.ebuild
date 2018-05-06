# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Listen to postgres events and forward them as JSON payloads to a webhook"
HOMEPAGE="https://github.com/hasura/skor"
SRC_URI="https://github.com/hasura/skor/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-db/postgresql
"
RDEPEND="${DEPEND}"

src_install() {
	dobin build/skor
	dodoc README.md
}
