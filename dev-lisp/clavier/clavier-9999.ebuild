# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="General purpose validation library for Common Lisp"
HOMEPAGE="https://github.com/mmontone/clavier"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mmontone/clavier.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/closr-mop
	dev-lisp/chronicity
	dev-lisp/cl-fad
	test? ( dev-lisp/stefil )
"

src_prepare() {
	eapply_user
	use test || rm ${PN}.test.asd test.lisp
}
