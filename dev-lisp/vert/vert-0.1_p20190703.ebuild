# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c60d8876a99688bdba71cb8d26fa2b26e527d8b1"

DESCRIPTION="A simple 2d game engine"
HOMEPAGE="https://github.com/realark/vert"
SRC_URI="https://github.com/realark/vert/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-sdl2
	dev-lisp/cl-sdl2-mixer
	dev-lisp/cl-opengl
	dev-lisp/cl-soil
	dev-lisp/cl-freetype2
	dev-lisp/glkit
	dev-lisp/simple-cqueue
	dev-lisp/cl-annot
	dev-lisp/bordeaux-threads
	dev-lisp/alexandria
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem vert\/test/,$d' ${PN}.asd
		rm -rf t
	fi
}

