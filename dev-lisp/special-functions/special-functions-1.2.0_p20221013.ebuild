# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f3ca2792ff3f8351839c366413da6b1bb2965a58"

DESCRIPTION="Implementation of special functions"
HOMEPAGE="https://github.com/lisp-stat/special-functions"
SRC_URI="https://github.com/lisp-stat/special-functions/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MS-PL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/numerical-utilities
	dev-lisp/float-features
	dev-lisp/let-plus
	dev-lisp/alexandria-plus
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem #:special-functions\/tests/,$d' \
		-i ${PN}.asd
	rm -rf tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all description.text
}
