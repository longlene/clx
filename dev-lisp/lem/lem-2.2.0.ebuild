# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Common Lisp editor/IDE with high expansibility"
HOMEPAGE="https://github.com/lem-project/lem"
SRC_URI="https://github.com/lem-project/lem/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/sbcl
	dev-lisp/alexandria
	dev-lisp/trivial-gray-streams
	dev-lisp/trivial-types
	dev-lisp/cl-ppcre
	dev-lisp/inquisitor
	dev-lisp/babel
	dev-lisp/bordeaux-threads
	dev-lisp/yason
	dev-lisp/log4cl
	dev-lisp/split-sequence
	dev-lisp/dexador

	dev-lisp/iterate
	dev-lisp/closer-mop
	dev-lisp/trivia

	dev-lisp/cffi
	dev-lisp/cl-charms
	dev-lisp/trivial-clipboard
	dev-lisp/cl-setlocale

	dev-lisp/async-process

	dev-lisp/usocket

	dev-lisp/jsonrpc

	dev-lisp/esrap

	dev-lisp/cl-package-locks
	dev-lisp/quri

	dev-lisp/cl-change-case

	app-emacs/slime
"
BDEPEND=""

src_prepare() {
	default
	rm -rf lem-tests.asd tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all lib/encodings/*.table \
		modes/*/*.json
}

