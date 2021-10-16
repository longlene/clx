# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="5e47e70446b650c85a9810b9401bb2a4083d189c"

DESCRIPTION="LuaVela is an interpreter and a Just-In-Time (JIT) compiler for Lua"
HOMEPAGE="https://github.com/iponweb/luavela"
SRC_URI="https://github.com/iponweb/luavela/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_MAKEFILE_GENERATOR="emake"

src_prepare() {
	default
	sed -e "/DESTINATION lib/{s#lib#$(get_libdir)#}" \
		-e 's#${UJIT_ETC_DIR}/ujit.1.gz#${PROJECT_SOURCE_DIR}/etc/ujit.1#' \
		-i src/CMakeLists.txt
	cmake_src_prepare
}
