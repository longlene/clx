# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="620772ae6146d510a8d58d07cae055c06e5c8620"

DESCRIPTION="A small event system for games"
HOMEPAGE="https://github.com/cbaggers/skitter"
SRC_URI="https://github.com/cbaggers/skitter/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/rtg-math
	dev-lisp/structy-defclass
	dev-lisp/glop
	dev-lisp/cl-sdl2
"
