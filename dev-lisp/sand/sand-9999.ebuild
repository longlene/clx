# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="A little sandbox to play around in"
HOMEPAGE="https://github.com/sjl/sand"
SRC_URI=""

EGIT_REPO_URI="https://github.com/sjl/sand.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/cl-algebraic-data-type
	dev-lisp/cl-arrows
	dev-lisp/cl-charms
	dev-lisp/cl-fad
	dev-lisp/clss
	dev-lisp/compiler-macro
	dev-lisp/drakma
	dev-lisp/flexi-streams
	dev-lisp/function-cache
	dev-lisp/html-entities
	dev-lisp/iterate
	dev-lisp/cl-losh
	dev-lisp/parenscript
	dev-lisp/plump
	dev-lisp/rs-colors
	dev-lisp/sanitize
	dev-lisp/sketch
	dev-lisp/split-sequence
	dev-lisp/trivia
	dev-lisp/yason
"
