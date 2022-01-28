# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8cf040408c5feca2e4b1092ccf45b20562ddb13f"

DESCRIPTION="Simple Common Lisp REPL"
HOMEPAGE="https://github.com/fukamachi/mondo"
SRC_URI="https://github.com/fukamachi/mondo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
	dev-lisp/cl-readline
	dev-lisp/cffi
	dev-lisp/babel
	dev-lisp/usocket
	dev-lisp/yason
	app-emacs/slime
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem "mondo\/tests/,$d' ${PN}.asd
	rm -rf tests
}
