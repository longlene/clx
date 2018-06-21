# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="C++ coroutine library"
HOMEPAGE="https://github.com/yyzybb537/libgo"
SRC_URI="https://github.com/yyzybb537/libgo/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="boost"

DEPEND="
	boost? ( dev-libs/boost[context] )
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e 's#set(DISABLE_DYNAMIC_LIB ON)#set(DISABLE_DYNAMIC_LIB OFF)#' \
		-e "/install/{s#DESTINATION \"lib\"#DESTINATION \"$(get_libdir)\"#g}" \
		-i CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DDEPEND_BOOST=$(usex boost)
	-DENABLE_BOOST_CONTEXT=$(usex boost)
	)
	cmake-utils_src_configure
}

