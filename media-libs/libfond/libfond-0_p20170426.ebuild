# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="72b06b4f62689663f9a52a566c9ad7d49a0258a0"

DESCRIPTION="Simple OpenGL font rendering based on stb_truetype"
HOMEPAGE="https://github.com/Shirakumo/libfond"
SRC_URI="https://github.com/Shirakumo/libfond/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	virtual/opengl
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i "/install/{s#/usr/local/lib#/usr/$(get_libdir)#}" CMakeLists.txt
}

src_install() {
	cmake_src_install
	insinto /usr/include
	doins src/fond.h
}

