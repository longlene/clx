# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Libpurple protocol plugin for matrix"
HOMEPAGE="https://github.com/matrix-org/purple-matrix"
SRC_URI="https://github.com/matrix-org/purple-matrix/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/json-gli1b
	net-im/pidgin
"
RDEPEND="${DEPEND}"
