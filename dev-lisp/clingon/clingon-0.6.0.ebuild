# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Command-line options parser system for Common Lisp"
HOMEPAGE="https://github.com/dnaeon/clingon"
SRC_URI="https://github.com/dnaeon/clingon/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bobbin
	dev-lisp/cl-reexport
	dev-lisp/split-sequence
	dev-lisp/with-user-abort
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}.demo.asd ${PN}.intro.asd ${PN}.test.asd examples tests
}
