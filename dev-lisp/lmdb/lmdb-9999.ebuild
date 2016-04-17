# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="LMDB bindings for Common Lisp"
HOMEPAGE="https://github.com/antimer/lmdb"
SRC_URI=""

EGIT_REPO_URI="https://github.com/antimer/lmdb.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/bit-smasher
	dev-lisp/liblmdb
	dev-lisp/trivial-utf8
"

src_prepare() {
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
