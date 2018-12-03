# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3c86d43d07b0d412a0133b0af997f302be5398e8"

DESCRIPTION="A Common Lisp OpenGL nodal UI/DE"
HOMEPAGE="https://github.com/Seteeri/protoform"
SRC_URI="https://github.com/Seteeri/protoform/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/osicat
	dev-lisp/cl-drm
	dev-lisp/cl-gbm
	dev-lisp/cl-egl
	dev-lisp/cl-opengl
	dev-lisp/cl-wayland
	dev-lisp/cl-libinput
	dev-lisp/cl-xkb
	dev-lisp/cl-pango
	dev-lisp/cl-cairo2
	dev-lisp/cl-glfw3
	dev-lisp/3d-vectors
	dev-lisp/3d-matrices
	dev-lisp/cl-digraph
	dev-lisp/usocket
	dev-lisp/pango-markup
	dev-lisp/bordeaux-threads
	dev-lisp/inferior-shell
	dev-lisp/swank
	dev-lisp/trivial-timers
	dev-lisp/str
	dev-lisp/easing
	dev-lisp/lparallel
	dev-lisp/skip-list
"
BDEPEND=""
