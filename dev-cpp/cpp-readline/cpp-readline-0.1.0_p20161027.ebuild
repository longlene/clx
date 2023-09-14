# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="d78bcc627c73947b3528b35fd2bc7bb70fbb02ad"

DESCRIPTION="A very simple C++ wrapper for GNU readline"
HOMEPAGE="https://github.com/Svalorzen/cpp-readline"
SRC_URI="https://github.com/Svalorzen/cpp-readline/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND="
	sys-libs/readline
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DBUILD_EXAMPLES=$(usex example)
	)
	cmake_src_configure
}

src_install() {
	dolib.so ${BUILD_DIR}/src/libcpp-readline.so*
	insinto /usr/include
	doins src/Console.hpp
	dodoc README.md
}
