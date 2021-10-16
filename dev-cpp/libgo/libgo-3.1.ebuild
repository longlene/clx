# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake vcs-snapshot

DESCRIPTION="C++ coroutine library"
HOMEPAGE="https://github.com/yyzybb537/libgo"
SRC_URI="https://github.com/yyzybb537/libgo/archive/v${PV}-stable.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="+shared"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -e "/install/{s#DESTINATION \"lib\"#DESTINATION \"$(get_libdir)\"#g}" \
		-i CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DBUILD_DYNAMIC=$(usex shared)
	)
	cmake_src_configure
}

