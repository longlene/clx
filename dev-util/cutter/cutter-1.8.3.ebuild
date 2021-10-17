# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="A Qt and C++ GUI for radare2 reverse engineering framework"
HOMEPAGE="https://github.com/radareorg/cutter"
SRC_URI="https://github.com/radareorg/cutter/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-qt/qtsvg
	dev-util/radare2
"
RDEPEND="${DEPEND}"

CMAKE_USE_DIR="${S}"/src

src_prepare() {
	eapply_user
	sed -i '/add_executable/,${s#Cutter#cutter#}' src/CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DCUTTER_ENABLE_JUPYTER=OFF
	)
	cmake_src_configure
}

src_install() {
	dobin ${BUILD_DIR}/cutter
	dodoc README.md
}
