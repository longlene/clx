# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="A portable and fast pairing-based cryptography library"
HOMEPAGE="https://github.com/herumi/mcl"
SRC_URI="https://github.com/herumi/mcl/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/gmp
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i "/DESTINATION/{s#DESTINATION lib#DESTINATION $(get_libdir)#}" CMakeLists.txt
	cmake_src_prepare
}
