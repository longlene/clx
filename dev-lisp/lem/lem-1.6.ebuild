# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="55621ac192d00fa7848c5a1b0c4d7a9944b795f6"

DESCRIPTION="Common Lisp editor/IDE with high expansibility"
HOMEPAGE="https://github.com/cxxxr/lem"
SRC_URI="https://github.com/cxxxr/lem/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/uiop
	dev-lisp/cl-ppcre
	dev-lisp/babel
	dev-lisp/cl-annot
	dev-lisp/trivial-gray-streams
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-clipboard
	dev-lisp/yason
	dev-lisp/cl-freetype2
	dev-lisp/trivial-types
	dev-lisp/usocket
	dev-lisp/optima
	dev-lisp/cl-charms
	dev-lisp/jsonrpc
	dev-lisp/esrap
	app-emacs/slime
"

