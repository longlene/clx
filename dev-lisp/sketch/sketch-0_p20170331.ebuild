# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="df894ec3b95d0538afb0fbc6e21f0717c0363968"

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
	eapply_user
	use example || rm -r examples ${PN}-examples.asd
}
