# Copyright 2008-2017 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e256df21902217a3064e5e05b2b8b7605d2001de"

DESCRIPTION="A set of CFFI bindings to the OpenGL, GLU and GLUT APIs."
HOMEPAGE="http://common-lisp.net/project/cl-opengl/"
SRC_URI="https://github.com/3b/cl-opengl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

RDEPEND="
	dev-lisp/cffi
	dev-lisp/alexandria
	virtual/opengl
"
src_prepare() {
	eapply_user
	use example || rm -rf cl-glut-examples.asd examples
}

src_compile() {
	:
}