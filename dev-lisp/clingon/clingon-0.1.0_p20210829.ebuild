# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="dfa406a10b82a85f2db468179f84b60879ee01ca"

DESCRIPTION="Command-line options parser system for Common Lisp"
HOMEPAGE="https://github.com/dnaeon/clingon"
SRC_URI="https://github.com/dnaeon/clingon/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
