# Copyright 2025 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="377a091dd552689104f2cfb92063c41f3f9a4de7"

DESCRIPTION="A set of CFFI bindings to the OpenGL, GLU and GLUT APIs."
HOMEPAGE="
	http://common-lisp.net/project/cl-opengl/
	https://github.com/3b/cl-opengl
"
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
	default
	use example || rm -rf cl-glut-examples.asd examples
}

src_compile() {
	:
}
