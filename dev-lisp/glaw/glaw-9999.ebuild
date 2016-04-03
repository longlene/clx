# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="OpenGL based Common Lisp game toolkit"
HOMEPAGE="https://github.com/patzy/glaw"
SRC_URI=""

EGIT_REPO_URI="https://github.com/patzy/glaw.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-alc
	dev-lisp/cl-opengl
	dev-lisp/cl-openal
	dev-lisp/imago
	dev-lisp/lispbuilder-sdl
	dev-lisp/lispbuilder-sdl-image
"

src_prepare() {
	use example || rm -rf examples ${PN}-examples.asd
}
