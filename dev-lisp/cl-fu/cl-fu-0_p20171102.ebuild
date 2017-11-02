# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="194368a43f4488629ab4fd093cd51d2fc0bc3677"

DESCRIPTION="NCURSES bindings in Common Lisp. FU very much"
HOMEPAGE="https://github.com/stacksmith/cl-fu"
SRC_URI="https://github.com/stacksmith/cl-fu/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	sys-libs/ncurses
"
