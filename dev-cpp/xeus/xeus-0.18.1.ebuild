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
	dev-cpp/json
	=dev-cpp/cryptopp-5.6.5
	dev-cpp/xtl
	>=net-libs/cppzmq-4.2.3
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e 's#cryptopp-static#cryptopp#' -i CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DCMAKE_MODULE_PATH=${FILESDIR}
	)
	cmake-utils_src_configure
}
