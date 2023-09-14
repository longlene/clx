# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0abcfca715456589b027aac20b875b00abdd5f18"

DESCRIPTION="Yet another 3D Tetris clone"
HOMEPAGE="https://github.com/grouzen/cl-tetris3d"
SRC_URI="https://github.com/grouzen/cl-tetris3d/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lisp/cl-opengl
	dev-lisp/lispbuilder-sdl
	dev-lisp/cl-glu
	dev-lisp/iterate
"
