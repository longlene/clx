# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6b73a1de0bc6a67b4137cef041aa8d3c39d7ba92"

DESCRIPTION="Database Schema Migration System for Common Lisp"
HOMEPAGE="https://github.com/dnaeon/cl-migratum"
SRC_URI="https://github.com/dnaeon/cl-migratum/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/local-time
	dev-lisp/cl-ascii-table
	dev-lisp/log4cl
	test? ( dev-lisp/rove )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}.test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
