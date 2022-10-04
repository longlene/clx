# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A graph concurrent library for C++"
HOMEPAGE="https://github.com/bloomen/gcl"
SRC_URI="https://github.com/bloomen/gcl/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e "/install/{s#DESTINATION lib#DESTINATION $(get_libdir)#g}" \
		-i CMakeLists.txt
	cmake_src_prepare
}
