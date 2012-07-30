## Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="QShaderEdit is a simple multiplatform shader editor inspired by Apple?s OpenGL Shader Builder."
HOMEPAGE="http://code.google.com/p/qshaderedit/"

SRC_URI="http://qshaderedit.googlecode.com/files/${P}.tar.gz"

KEYWORDS="~x86"

LICENSE="GPL2" 

SLOT="0"

IUSE=""

DEPEND=">=dev-util/cmake-2.4"
RDEPEND=">=x11-libs/qt-4.2
	 >=media-libs/glew-1.3"

S="${WORKDIR}/${PN}"

src_compile(){
	cmake . || die "cmake failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR=${D} install || die "emake install failed"
}
