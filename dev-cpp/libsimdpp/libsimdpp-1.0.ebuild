# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="C++ wrapper for SIMD intrinsics of multiple instruction sets"
HOMEPAGE="https://github.com/p12tic/libsimdpp"
SRC_URI="https://github.com/p12tic/libsimdpp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -e '/add_subdir/{/doc/d}' \
		-e 's#PKF_FULL_NAME#PKG_NAME#' \
		-e 's#${PKG_FULL_NAME}##' \
		-i CMakeLists.txt
}
