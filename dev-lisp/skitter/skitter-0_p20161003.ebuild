# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="21070173d29897e62d5b1d445978fb00898d91c1"

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
