# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 desktop

EGIT_COMMIT="b242c4bfce7a18a4b1a058b901cd0334f66b9a6f"

DESCRIPTION="Common Lisp editor/IDE with high expansibility"
HOMEPAGE="https://github.com/lem-project/lem"
SRC_URI="https://github.com/lem-project/lem/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

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
	dev-lisp/lem-extension-manager

	dev-lisp/cl-charms
	dev-lisp/cl-setlocale
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
	#doicon scripts/install/lem.svg
	#domenu scripts/install/lem.desktop
	#dobin lem
	einstalldocs
}

