# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="8feae63a46fdf8ed83613b6a46da25d44adde07f"

DESCRIPTION="Antialiased 2D vector drawing library on top of OpenGL for UI and visualizations"
HOMEPAGE="https://github.com/memononen/nanovg"
SRC_URI="https://github.com/memononen/nanovg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-util/premake
"
RDEPEND="${DEPEND}"

src_configure() {
	premake4 gmake
	sed -i 's#$(ARCH)##g' build/*.make
}

src_compile() {
	make -C build nanovg
}

src_install() {
	dolib.a build/libnanovg.a
	insinto /usr/include
	doins src/nanovg.h
	dodoc README.md
}

