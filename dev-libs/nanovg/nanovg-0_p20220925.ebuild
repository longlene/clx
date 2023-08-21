# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="7544c114e83db7cf67bd1c9e012349b70caacc2f"

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
	sed -i '/-Wall/{s#$# -fPIC#}' build/nanovg.make
}

src_compile() {
	make -C build nanovg
}

src_install() {
	dolib.a build/libnanovg.a
	insinto /usr/include
	doins src/nanovg{,_gl}.h
	dodoc README.md
}

