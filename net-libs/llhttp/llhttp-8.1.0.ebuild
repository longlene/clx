# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="HTTP parser in LLVM IR"
HOMEPAGE="http://llhttp.org/"
SRC_URI="https://github.com/nodejs/llhttp/archive/refs/tags/release/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

#CMAKE_IN_SOURCE_BUILD=yes

src_prepare() {
	default
	sed -e "s#_RELEASE_#\"${PV}\"#" \
		-i CMakeLists.txt
	cmake_src_prepare
}
