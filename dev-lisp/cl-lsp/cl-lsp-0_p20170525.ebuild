# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="774c73081a8762943cafd34e5c663960d312d744"

DESCRIPTION="An implementation of the Language Server Protocol for Common Lisp"
HOMEPAGE="https://github.com/cxxxr/cl-lsp"
SRC_URI="https://github.com/cxxxr/cl-lsp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	app-emacs/slime
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-gray-streams
	dev-lisp/cl-ppcre
	dev-lisp/optima
	dev-lisp/alexandria
	dev-lisp/trivial-types
	dev-lisp/closer-mop
	dev-lisp/quri
	dev-lisp/jsonrpc
	dev-lisp/yason
	dev-lisp/uiop
	dev-lisp/iterate
	dev-lisp/cl-annot
"