# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="C++ Reflection Library"
HOMEPAGE="http://www.rttr.org"
SRC_URI="https://github.com/rttrorg/rttr/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DBUILD_UNIT_TESTS=$(usex test)
	-DBUILD_DOCUMENTATION=OFF
	-DBUILD_EXAMPLES=OFF
	-DBUILD_INSTALLER=OFF
	-DBUILD_PACKAGE=OFF
	-DBUILD_PCH=OFF
	)
	cmake_src_configure
}
