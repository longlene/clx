# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils git-2

DESCRIPTION="Lightweight and fast JSON parser for C++"
HOMEPAGE="https://github.com/vivkin/gason"
SRC_URI=""

EGIT_REPO_URI="https://github.com/vivkin/gason.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -e '/test-suite/d' \
		-e '/benchmark/d' \
		-i CMakeLists.txt
}

src_install() {
	insinto /usr/include
	doins src/gason.h
	dolib.a ${CMAKE_BUILD_DIR}/libgason.a
	dodoc README.md
}
