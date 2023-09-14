# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Signals & Slots implementation in Common Lisp"
HOMEPAGE="https://github.com/sbenitezb/sigslot"
SRC_URI="https://github.com/sbenitezb/sigslot/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/trivial-garbage
	dev-lisp/trivial-main-thread
	dev-lisp/bordeaux-threads
	dev-lisp/jpl-queues
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem #:sigslot\/tests/,$d' \
		-i ${PN}.asd
	rm -rf tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
