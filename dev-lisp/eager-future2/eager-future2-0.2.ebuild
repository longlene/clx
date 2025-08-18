# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Parallel programming library providing the futures/promises synchronization mechanism"
HOMEPAGE="https://eager-future.common-lisp.dev/"
SRC_URI="https://eager-future.common-lisp.dev/release/${P}.tgz"

LICENSE="LGPL-3.0+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-garbage
"
BDEPEND=""

src_prepare() {
	default
	rm -rf test.${PN}.asd test
}
