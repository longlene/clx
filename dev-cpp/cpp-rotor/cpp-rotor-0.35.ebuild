# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Event loop friendly C++ actor micro-framework"
HOMEPAGE="https://github.com/basiliscos/cpp-rotor"
SRC_URI="https://github.com/basiliscos/cpp-rotor/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-libs/boost"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e "s#DESTINATION lib#DESTINATION $(get_libdir)#" -i CMakeLists.txt
	cmake_src_prepare
}
