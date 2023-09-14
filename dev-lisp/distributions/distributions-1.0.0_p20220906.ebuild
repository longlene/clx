# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ea72622073ee7e005dfdc621ce1e5a83b22bb39e"

DESCRIPTION="Random variates for Common Lisp"
HOMEPAGE="https://github.com/Lisp-Stat/distributions"
SRC_URI="https://github.com/Lisp-Stat/distributions/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MS-PL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/array-operations
	dev-lisp/cephes
	dev-lisp/numerical-utilities
	dev-lisp/special-functions
	dev-lisp/let-plus
	dev-lisp/float-features
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem :distributions\/tests/,$d' \
		-i ${PN}.asd
	rm -rf tests
}
