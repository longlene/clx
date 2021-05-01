# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="60df10f8584b0565cac39c1fa43869471776650e"

DESCRIPTION="Tetris game written in Common Lisp"
HOMEPAGE="https://github.com/knusbaum/cl-tetris"
SRC_URI="https://github.com/knusbaum/cl-tetris/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-sdl2
"
