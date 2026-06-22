# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Runtime-native coding agent harness for Common Lisp"
HOMEPAGE="https://github.com/masatoi/cl-harness"
SRC_URI="https://github.com/masatoi/cl-harness/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-lisp/alexandria
	dev-lisp/yason
	dev-lisp/local-time
	dev-lisp/dexador
	dev-lisp/usocket
	dev-lisp/bordeaux-threads
	dev-lisp/clingon
"

src_compile() {
	:
}

src_install() {
	common-lisp-3_src_install
	einstalldocs
}
