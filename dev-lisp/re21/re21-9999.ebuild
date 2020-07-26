# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 common-lisp-3

DESCRIPTION="CL21's spin-off project that provides neat API for regular expressions"
HOMEPAGE="https://github.com/fukamachi/re21"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/re21.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/cl-syntax
	dev-lisp/split-sequence
"

src_prepare() {
	use test || rm -rf t re21-test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
