# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="doplus (written DO+) is an iteration macro for Common Lisp"
HOMEPAGE="https://github.com/alessiostalla/doplus"
SRC_URI="https://github.com/alessiostalla/doplus/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/parse-declarations
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-tests.asd tests.lisp
}
