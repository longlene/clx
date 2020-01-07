# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Mars is a cross-platform network component developed by WeChat"
HOMEPAGE="https://github.com/Tencent/mars"
SRC_URI="https://github.com/Tencent/mars/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_USE_DIR="${S}/mars"

src_prepare() {
	default
	sed -i "s#\${CMAKE_SYSTEM_NAME}.out#$(get_libdir)#" mars/*/CMakeLists.txt
	cmake-utils_src_prepare
}

src_install() {
	cmake-utils_src_install
	local dir
	for dir in app baseevent boost comm log sdt stn ; do
		insinto /usr/include/mars/${dir}
		doins mars/${dir}/*.h
    done
}
