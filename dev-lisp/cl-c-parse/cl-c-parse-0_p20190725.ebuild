# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4f9a6c61919c6ce5cb75a2500e9308b92cc5f6df"

DESCRIPTION="C11 Parser in Common Lisp"
HOMEPAGE="https://github.com/gmasching/cl-c-parse"
SRC_URI="https://github.com/gmasching/cl-c-parse/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/split-sequence
	dev-lisp/uiop
	dev-lisp/esrap-liquid
	dev-lisp/utility
	dev-lisp/cl-yacc
	dev-lisp/uncommon-lisp
	dev-lisp/trivia
	dev-lisp/fiveam
	dev-lisp/deflazy
	dev-lisp/osicat
"
BDEPEND=""
