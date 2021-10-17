# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="0a4c745f2c2c195c34846446e925f748288ff849"

DESCRIPTION="C++ interface to the torch7 TH library"
HOMEPAGE="https://github.com/facebook/thpp"
SRC_URI="https://github.com/facebook/thpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="
	sci-libs/torch7
	test? ( dev-cpp/glog )
"
RDEPEND="${DEPEND}"

CMAKE_USE_DIR="${S}"/thpp

src_configure() {
	local mycmakeargs=(
	-DNO_THRIFT=TRUE
	-DNO_FOLLY=TRUE
	-DNO_TESTS=$(usex !test)
	)
	cmake_src_configure
}

