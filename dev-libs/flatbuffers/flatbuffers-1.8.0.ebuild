# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils flag-o-matic java-pkg-opt-2

DESCRIPTION="Memory efficient serialization library"
HOMEPAGE="https://google.github.io/flatbuffers/"
SRC_URI="https://github.com/google/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="example java static-libs test"

DEPEND="java? ( >=virtual/jdk-1.5 )"
RDENPEND="${DEPEND}"

CMAKE_BUILD_TYPE=Release

src_prepare() {
	sed -i -e "s/DESTINATION lib/DESTINATION $(get_libdir)/" CMakeLists.txt || die

	cmake-utils_src_prepare
}

src_configure() {
	append-cppflags -std=c++11

	local mycmakeargs=(
		-DFLATBUFFERS_BUILD_FLATLIB=$(usex static-libs)
		-DFLATBUFFERS_BUILD_SHAREDLIB=ON
		-DFLATBUFFERS_BUILD_TESTS=$(usex test)
		-DFLATBUFFERS_BUILD_FLATC=ON
		-DFLATBUFFERS_INSTALL=ON
	)

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile

	if use java ; then
	   (cd java && mkdir classes && \
		ejavac -d classes com/google/flatbuffers/*.java && \
		jar cf ${PN}.jar -C classes/ .)
	fi
}

src_install() {
	cmake-utils_src_install

	insinto /usr/include
	doins -r include/flatbuffers

	dodoc -r docs

	if use example ; then
		dodoc -r samples
	fi

	if use java ; then
	   java-pkg_dojar java/${PN}.jar
	fi
}
