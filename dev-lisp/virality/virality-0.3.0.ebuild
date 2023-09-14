# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Virality Engine"
HOMEPAGE="https://github.com/HackerTheory/ViralityEngine"
SRC_URI="https://github.com/HackerTheory/ViralityEngine/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/babel
	dev-lisp/cl-graph
	dev-lisp/cl-opengl
	dev-lisp/cl-ppcre
	dev-lisp/closer-mop
	dev-lisp/doubly-linked-list
	dev-lisp/fast-io
	dev-lisp/glsl-packing
	dev-lisp/golden-utils
	dev-lisp/jsown
	dev-lisp/origin
	dev-lisp/simple-cqueue
	dev-lisp/cl-sdl2
	dev-lisp/cl-sdl2-image
	dev-lisp/split-sequence
	dev-lisp/static-vectors
	dev-lisp/trivial-features
	dev-lisp/uiop
	dev-lisp/varjo
	dev-lisp/verbose
"
BDEPEND=""
