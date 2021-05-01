# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="A full-featured repl implementation designed to work with Roswell"
HOMEPAGE="https://github.com/koji-kojiro/cl-repl"
SRC_URI="https://github.com/koji-kojiro/cl-repl/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/uiop
	dev-lisp/cl-fad
	dev-lisp/cl-ppcre
	dev-lisp/cl-ansi-text
	dev-lisp/cl-readline
	dev-lisp/inferior-shell
	dev-lisp/trivial-timeout
	dev-lisp/trivial-documentation
	dev-lisp/split-sequence
	dev-lisp/cffi
"
