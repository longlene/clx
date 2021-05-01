# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6addb537907eaa9014bfe1906b8c7c5fb87b263b"

DESCRIPTION="Code javascript in your Common Lisp REPL and have it evalled in real time"
HOMEPAGE="https://github.com/ahungry/defjs"
SRC_URI="https://github.com/ahungry/defjs/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/parenscript
	dev-lisp/clws
	dev-lisp/hunchentoot
	dev-lisp/cl-who
	dev-lisp/cl-json
	dev-lisp/glyphs
"
