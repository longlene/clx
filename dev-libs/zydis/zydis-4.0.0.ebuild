# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

ZYCORE_COMMIT="1401fb85ac313f6605ec795c52bf99ea3f292a69"

DESCRIPTION="Fast and lightweight x86/x86-64 disassembler and code generation library"
HOMEPAGE="https://zydis.re/"
SRC_URI="
	https://github.com/zyantific/zydis/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/zyantific/zycore-c/archive/${ZYCORE_COMMIT}.tar.gz -> zycore-c-${ZYCORE_COMMIT}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir dependencies/zycore && ln -sv "${WORKDIR}"/zycore-c-${ZYCORE_COMMIT} dependencies/zycore
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DZYDIS_BUILD_EXAMPLES=OFF
		-DZYDIS_BUILD_TESTS=OFF
	)
	cmake_src_configure
}
