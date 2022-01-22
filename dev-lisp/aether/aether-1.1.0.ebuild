# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Distributed system emulation in Common Lisp"
HOMEPAGE="https://github.com/dtqec/aether"
SRC_URI="https://github.com/dtqec/aether/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/policy-cond
	dev-lisp/cl-heap
	dev-lisp/global-vars
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-tests.asd tests
}

sc_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all VERSION.txt
}
