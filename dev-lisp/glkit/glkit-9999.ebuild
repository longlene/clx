# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="OpenGL utilities for math, shaders"
HOMEPAGE="https://github.com/lispgames/glkit"
SRC_URI=""

EGIT_REPO_URI="https://github.com/lispgames/glkit.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/defpackage-plus
	dev-lisp/cl-opengl
	dev-lisp/mathkit
	dev-lisp/sb-cga
	dev-lisp/static-vectors
"

src_prepare() {
	use example || rm -rf examples ${PN}-examples.asd

}
