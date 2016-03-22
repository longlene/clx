# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Sketch is a Common Lisp framework for the creation of electronic art, computer graphics, visual design, game making and more"
HOMEPAGE="https://github.com/vydd/sketch"
SRC_URI=""

EGIT_REPO_URI="https://github.com/vydd/sketch.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-geometry
	dev-lisp/glkit
	dev-lisp/mathkit
	dev-lisp/md5
	dev-lisp/sb-cga
	dev-lisp/sdl2-image
	dev-lisp/sdl2-ttf
	dev-lisp/sdl2kit
	dev-lisp/static-vectors
"

src_prepare() {
	use example || rm -r examples ${PN}-examples.asd
}
