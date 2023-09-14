# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="58e9718bc9446e6246670608362589f812812e96"

DESCRIPTION="Common Lisp bindings for the Tk GUI toolkit"
HOMEPAGE="https://notabug.org/cage/nodgui/"
SRC_URI="https://notabug.org/cage/nodgui/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lang/tk
	dev-lisp/alexandria
	dev-lisp/cl-unicode
	dev-lisp/cl-ppcre
	dev-lisp/cl-lex
	dev-lisp/cl-yacc
	dev-lisp/parse-number
	dev-lisp/clunit2
	dev-lisp/cl-colors2
	dev-lisp/named-readtables
	dev-lisp/cl-jpeg
	dev-lisp/bordeaux-threads
"
BDEPEND=""
