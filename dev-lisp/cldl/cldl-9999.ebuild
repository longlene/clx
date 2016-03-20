# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Deep Learning in Common Lisp"
HOMEPAGE="https://github.com/Rudolph-Miller/cldl"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Rudolph-Miller/cldl.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-syntax
	dev-lisp/alexandria
	dev-lisp/closer-mop
"

src_prepare() {
	use test || rm -r t ${PN}-test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
