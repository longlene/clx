# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Common Lisp tOml Parser"
HOMEPAGE="https://github.com/sheepduke/clop/"
SRC_URI="https://github.com/sheepduke/clop/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/esrap
	dev-lisp/parser-number
	dev-lisp/local-time
	dev-lisp/str
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem clop-tests/,$d' ${PN}.asd
	rm -rf tests
}
