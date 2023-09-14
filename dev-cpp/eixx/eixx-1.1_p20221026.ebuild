# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake flag-o-matic vcs-snapshot

EGIT_COMMIT="d3b9d96c6d5a9ba855e0cc9b2cf9be7f2e8026e6"

DESCRIPTION="Erlang C++ Interface"
HOMEPAGE="https://github.com/saleyn/eixx"
SRC_URI="https://github.com/saleyn/eixx/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/boost
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/Boost_NO_SYSTEM_PATHS/{s#ON#OFF#}' \
		-e '/install/{/install-symlinks/d}' \
		-e '/add_subdirectory/{/test/d}' \
		-i CMakeLists.txt
	sed -e "s#DESTINATION lib#DESTINATION $(get_libdir)#" \
		-i src/CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DTOOLCHAIN=$(tc-get-compiler-type)
		-DEIXX_MARSHAL_ONLY=ON
	)
	cmake_src_configure
}

