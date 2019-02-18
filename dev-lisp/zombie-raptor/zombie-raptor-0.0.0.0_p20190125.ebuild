# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="231fa7831ecad864d6b73232ee19deb56c5cef76"

DESCRIPTION="A 3D game engine written in Common Lisp"
HOMEPAGE="https://gitlab.com/zombie-raptor/zombie-raptor"
SRC_URI="https://gitlab.com/zombie-raptor/zombie-raptor/repository/archive.tar.gz?ref=${EGIT_COMMIT} -> ${P}.tar.gz"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/cl-autowrap
	dev-lisp/cl-opengl
	dev-lisp/cl-plus-c
	dev-lisp/closer-mop
	dev-lisp/fiveam
	dev-lisp/cl-sdl2
	dev-lisp/specialization-store
	dev-lisp/static-vectors
	dev-lisp/trivial-gray-streams
	dev-lisp/uiop
	dev-lisp/zpb-ttf
"
BDEPEND=""
