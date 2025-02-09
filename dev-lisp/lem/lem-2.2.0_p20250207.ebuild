# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 desktop vcs-snapshot

EGIT_COMMIT="5c0fc53f72a78bee6ccb0be95bef700a31106acd"

DESCRIPTION="Common Lisp editor/IDE with high expansibility"
HOMEPAGE="https://github.com/lem-project/lem"
SRC_URI="https://github.com/lem-project/lem/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/closer-mop
	dev-lisp/trivia
	dev-lisp/alexandria
	dev-lisp/trivial-gray-streams
	dev-lisp/trivial-types
	dev-lisp/cl-ppcre
	dev-lisp/micros
	dev-lisp/inquisitor
	dev-lisp/babel
	dev-lisp/bordeaux-threads
	dev-lisp/yason
	dev-lisp/log4cl
	dev-lisp/split-sequence
	dev-lisp/str
	dev-lisp/dexador
	dev-lisp/lem-mailbox
	dev-lisp/cl-charms
	dev-lisp/cl-setlocale
	dev-lisp/esrap
	dev-lisp/cl-package-locks
	dev-lisp/async-process
	dev-lisp/3bmd
	app-emacs/slime
	dev-lisp/lisp-preprocessor
	dev-lisp/trivial-ws
	dev-lisp/trivial-open-browser
"
BDEPEND=""

src_prepare() {
	default
	rm -rf lem-tests.asd tests
}

src_compile() {
	:
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all extensions/*/*.json \
		extensions/markdown-mode/preview/external-browser-preview.html
	doicon scripts/install/lem.svg
	domenu scripts/install/lem.desktop
	#dobin lem
	einstalldocs
}

