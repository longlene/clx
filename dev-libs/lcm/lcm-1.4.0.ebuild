# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Lightweight Communications and Marshalling"
HOMEPAGE="https://github.com/lcm-proj/lcm"
SRC_URI="https://github.com/lcm-proj/lcm/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/glib
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DLCM_ENABLE_EXAMPLES=OFF
	-DLCM_ENABLE_JAVA=OFF
	-DLCM_ENABLE_LUA=OFF
	-DLCM_ENABLE_PYTHON=OFF
	-DLCM_ENABLE_TESTS=OFF
	)
	cmake_src_configure
}
