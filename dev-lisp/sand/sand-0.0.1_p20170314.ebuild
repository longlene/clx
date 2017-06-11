# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ba76cd5cfec3b90e7f80747ad316b5eded31bd9c"

DESCRIPTION="A little sandbox to play around in"
HOMEPAGE="https://github.com/sjl/sand"
SRC_URI="https://github.com/sjl/sand/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/cl-algebraic-data-type
	dev-lisp/cl-charms
	dev-lisp/cl-fad
	dev-lisp/clss
	dev-lisp/compiler-macro
	dev-lisp/drakma
	dev-lisp/easing
	dev-lisp/flexi-streams
	dev-lisp/function-cache
	dev-lisp/iterate
	dev-lisp/losh
	dev-lisp/cl-losh
	dev-lisp/parenscript
	dev-lisp/parse-float
	dev-lisp/plump
	dev-lisp/rs-colors
	dev-lisp/sanitize
	dev-lisp/sketch
	dev-lisp/split-sequence
	dev-lisp/trivia
	dev-lisp/trivial-main-thread
	dev-lisp/vex
	dev-lisp/yason
"

src_compile() {
	:
}
