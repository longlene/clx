# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="aea3f9509182749fa80bcc993dc0f284559b2392"

DESCRIPTION="Sketch is a Common Lisp framework for the creation of electronic art, computer graphics, visual design, game making and more"
HOMEPAGE="https://github.com/vydd/sketch"
SRC_URI="https://github.com/vydd/sketch/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
	dev-lisp/cl-sdl2-image
	dev-lisp/cl-sdl2-ttf
	dev-lisp/sdl2kit
	dev-lisp/static-vectors
"

src_prepare() {
	default	
	use example || rm -r examples ${PN}-examples.asd
}
