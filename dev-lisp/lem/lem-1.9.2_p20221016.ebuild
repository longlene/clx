# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0b163bea45248413d02abc67b5edd57d7db92e6f"

DESCRIPTION="Common Lisp editor/IDE with high expansibility"
HOMEPAGE="https://github.com/cxxxr/lem"
SRC_URI="https://github.com/cxxxr/lem/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
	dev-lisp/inquisitor
	dev-lisp/trivia
	dev-lisp/cl-setlocale
	dev-lisp/cl-package-locks
	dev-lisp/st-json
	dev-lisp/cl-change-case
	dev-lisp/trivial-package-local-nicknames
	app-emacs/slime
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all lib/encodings/*.table \
		modes/go-mode/go.json \
		modes/lsp-mode/client-capabilities.json \
		modes/sql-mode/sql.tmLanguage.json
}
