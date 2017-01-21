# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="de098f8d5debd8b14ef6864b5bdcbbf5ddbcfd72"

DESCRIPTION="cl-coroutine is a coroutine library for Common Lisp"
HOMEPAGE="https://github.com/takagi/cl-coroutine"
SRC_URI="https://github.com/takagi/cl-coroutine/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-cont
"

src_prepare() {
	use test || rm -rf t ${PN}-test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
