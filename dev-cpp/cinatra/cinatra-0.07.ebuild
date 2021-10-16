# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="modern c++, cross-platform, header-only, easy to use http framework"
HOMEPAGE="https://github.com/qicosmos/cinatra"
SRC_URI="https://github.com/qicosmos/cinatra/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/boost[context,threads]
"
RDEPEND="${DEPEND}"
