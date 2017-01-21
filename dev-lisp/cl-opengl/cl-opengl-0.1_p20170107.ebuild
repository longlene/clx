# Copyright 2008-2017 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="34636d9754676ddaca5fab64a4f1e055cb1b76b3"

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
	use example || rm -rf cl-glut-examples.asd examples
}

