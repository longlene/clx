# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="C++ implementation of the Jupyter kernel protocol"
HOMEPAGE="https://github.com/QuantStack/xeus"
SRC_URI="https://github.com/QuantStack/xeus/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-cpp/nlohmanh_json-3.2.0
	>=dev-cpp/xtl-0.5.0
	>=net-libs/cppzmq-4.3.0
	dev-libs/openssl
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DCMAKE_MODULE_PATH=${FILESDIR}
	)
	cmake-utils_src_configure
}
