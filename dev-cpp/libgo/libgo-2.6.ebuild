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
IUSE="+context"

DEPEND="
	dev-libs/boost[context?]
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/install/{/etc/d}' CMakeLists.txt
	sed -e '/set(Boost_USE_STATIC_LIBS/{s#ON#OFF#}' \
		-e '/set(Boost_USE_STATIC_RUNTIME/{s#ON#OFF#}' \
		-i boost.cmake
}

src_configure() {
	local mycmakeargs=(
	-DENABLE_BOOST_CONTEXT=$(usex context)
	-DENABLE_BOOST_COROUTINE=$(usex !context)
	)
	cmake-utils_src_configure
}

