# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="modern, simple, easy to use rpc framework"
HOMEPAGE="https://github.com/qicosmos/rest_rpc"
SRC_URI="https://github.com/qicosmos/rest_rpc/archive/V${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-cpp/Kapok
	dev-libs/spdlog
	dev-cpp/thread-pool-cpp
	dev-libs/boost[context]
"
RDEPEND="${DEPEND}"
