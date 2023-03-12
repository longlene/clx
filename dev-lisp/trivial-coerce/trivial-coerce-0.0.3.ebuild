# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="An extensible alternative to cl:coerce"
HOMEPAGE="https://github.com/digikar99/trivial-coerce"
SRC_URI="https://github.com/digikar99/trivial-coerce/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-types
	dev-lisp/closer-mop
	dev-lisp/ctype
	dev-lisp/optima
	dev-lisp/extensible-compound-types
	dev-lisp/extensible-compound-types-interfaces
"
BDEPEND=""

src_preapre() {
	default
	sed -e '/defsystem "trivial-coerce\/tests"/,$d' \
		-i ${PN}.asd
	rm tests.lisp
}
