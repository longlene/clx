# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="a framework for building solid multithreaded applications"
HOMEPAGE="https://stiffstream.com/en/products/sobjectizer.html"
SRC_URI="https://github.com/Stiffstream/sobjectizer/archive/v.${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_USE_DIR="${S}"/dev

src_prepare() {
	default
	sed -i "s#DESTINATION lib#DESTINATION $(get_libdir)#" dev/so_5/CMakeLists.txt
	cmake_src_prepare
}
