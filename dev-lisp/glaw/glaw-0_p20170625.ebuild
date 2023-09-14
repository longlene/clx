# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e678fc0c107ce4b1e3ff9921a6de7e32fd39bc37"

DESCRIPTION="OpenGL based Common Lisp game toolkit"
HOMEPAGE="https://github.com/patzy/glaw"
SRC_URI="https://github.com/patzy/glaw/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-openal
	dev-lisp/cl-opengl
	dev-lisp/cl-openal
	dev-lisp/imago
	dev-lisp/lispbuilder-sdl
	dev-lisp/lispbuilder-sdl-image
"

src_prepare() {
	default
	use example || rm -rf examples ${PN}-examples.asd
}
