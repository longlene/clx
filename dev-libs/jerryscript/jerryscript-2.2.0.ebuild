# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Ultra-lightweight JavaScript engine for the Internet of Things"
HOMEPAGE="https://jerryscript.net"
SRC_URI="https://github.com/jerryscript-project/jerryscript/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i "/install/{s#DESTINATION lib#DESTINATION $(get_libdir)#}" jerry-{core,ext,libm}/CMakeLists.txt jerry-port/default/CMakeLists.txt
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
	-DENABLE_STRIP=OFF
	)
	cmake-utils_src_configure
}
