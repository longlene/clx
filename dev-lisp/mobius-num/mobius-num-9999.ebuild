# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Comon Lisp numerical library"
HOMEPAGE="https://github.com/mobius-eng/mobius-num"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mobius-eng/mobius-num.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/mobius-utils
	dev-lisp/alexandira
	dev-lisp/optima
	dev-lisp/closer-mop
	test? ( dev-lisp/fiveam dev-lisp/cl-num-utils )
"

src_prepare() {
	use test || rm -rf tests ${PN}-tests.asd
}
