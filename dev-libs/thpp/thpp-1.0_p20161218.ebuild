# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="899817dd545921ad1fae5a3b015ec7b93f8e0c18"

DESCRIPTION="C++ interface to the torch7 TH library"
HOMEPAGE="https://github.com/facebook/thpp"
SRC_URI="https://github.com/facebook/thpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/glog
	sci-libs/torch7
"
RDEPEND="${DEPEND}"

CMAKE_USE_DIR="${S}"/thpp

src_configure() {
	local mycmakeargs=(
	-DNO_THRIFT=TRUE
	-DNO_FOLLY=TRUE
	-DNO_TESTS=TRUE
	)
	cmake_src_configure
}

