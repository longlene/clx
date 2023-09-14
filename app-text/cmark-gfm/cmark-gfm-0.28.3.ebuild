# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9} )

inherit cmake python-any-r1 vcs-snapshot

DESCRIPTION="CommonMark parsing and rendering library and program in C"
HOMEPAGE="https://github.com/github/cmark-gfm"
SRC_URI="https://github.com/github/cmark-gfm/archive/${PV}.gfm.20.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE="test"

DEPEND="test? ( ${PYTHON_DEPS} )"

pkg_setup() {
	use test && python-any-r1_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		-DCMARK_LIB_FUZZER=OFF
		-DCMARK_SHARED=ON
		-DCMARK_STATIC=OFF
		-DCMARK_TESTS="$(usex test)"
	)
	cmake_src_configure
}
