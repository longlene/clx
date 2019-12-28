# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="header-only serializer library"
HOMEPAGE="https://github.com/qicosmos/Kapok"
SRC_URI="https://github.com/qicosmos/Kapok/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/boost
	dev-cpp/fmt
	dev-libs/rapidjson
"

src_install() {
	insinto /usr/include
	doins -r kapok
	dodoc README.md
}
