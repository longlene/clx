# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="49bf60ef2d6bfb6b425a9246794ff6037ddd4e5f"

DESCRIPTION="Array slices for Common Lisp"
HOMEPAGE="https://github.com/Lisp-Stat/select"
SRC_URI="https://github.com/Lisp-Stat/select/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MS-PL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/let-plus
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem #:select\/tests/,$' ${PN}.asd
	rm -r tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp
}
