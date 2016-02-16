# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Automatic differentiation library for Common Lisp"
HOMEPAGE="https://github.com/mobius-eng/cl-ad"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mobius-eng/cl-ad.git"

LICENSE="LLGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	use test || rm ${PN}-tests.{asd,lisp}
}
