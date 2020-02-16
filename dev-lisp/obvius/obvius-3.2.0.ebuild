# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="A ressurrected image processing library"
HOMEPAGE="https://github.com/thicksteadTHpp/Obvius"
SRC_URI="https://github.com/thicksteadTHpp/Obvius/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="tiff"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/zpng
	dev-lisp/ffa
	dev-lisp/cl-fad
	dev-lisp/cffi
	dev-lisp/static-vectors
	dev-lisp/trivial-garbage
	dev-lisp/closer-mop
	dev-lisp/vom
	dev-lisp/chanl
	dev-lisp/cl-colors
	dev-lisp/cl-opengl
	dev-lisp/alexandra
	dev-lisp/claw
	dev-lisp/nuklear-blob
	dev-lisp/bodge-nuklear
	dev-lisp/glfw-blob
	dev-lisp/bodge-glfw
	dev-lisp/glad-blob
	dev-lisp/bodge-glad
	dev-lisp/trivial-main-thread
	dev-lisp/cl-soil
	media-libs/tiff
"
BDEPEND=""

src_compile() {
	emake -C c-source lib
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all bin/obv_gl.so
}
