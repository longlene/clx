# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="A Common Lisp Game Engine"
HOMEPAGE="https://github.com/colonyengine/colony"
SRC_URI="https://github.com/colonyengine/colony/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/3b-bmfont
	dev-lisp/babel
	dev-lisp/cl-cpus
	dev-lisp/cl-graph
	dev-lisp/cl-opengl
	dev-lisp/cl-ppcre
	dev-lisp/cl-slug
	dev-lisp/closer-mop
	dev-lisp/fast-io
	dev-lisp/global-vars
	dev-lisp/jsown
	dev-lisp/lparallel
	dev-lisp/vutils
	dev-lisp/vorigin
	dev-lisp/vshadow
	dev-lisp/vumbra
	dev-lisp/pngload
	dev-lisp/printv
	dev-lisp/queues
	dev-lisp/cl-sdl2
	dev-lisp/split-sequence
	dev-lisp/static-vectors
	dev-lisp/trivial-features
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}.test.asd test
}
