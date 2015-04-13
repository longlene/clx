# Copyright 2008-2012 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit common-lisp-2

DESCRIPTION="A set of CFFI bindings to the OpenGL, GLU and GLUT APIs."
HOMEPAGE="http://common-lisp.net/project/cl-opengl/"
SRC_URI="http://beta.quicklisp.org/archive/cl-opengl/2012-05-20/cl-opengl-20120520-git.tgz -> ${P}.tgz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="dev-lisp/cffi
		media-libs/freeglut"

CLSYSTEMS="cl-opengl cl-glu cl-glut cl-glut-examples"

src_unpack() {
	unpack ${A}
	mv ${PN}-*-git "${S}"
}

src_compile() { true; }

src_install() {
	common-lisp-install *.asd gl glu glut examples
	common-lisp-symlink-asdf
	dodoc README
}
