# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp with Arc Macros and Procedures"
HOMEPAGE="https://github.com/malisper/Clamp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/malisper/Clamp.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/cl-syntax
"

src_prepare() {
	eapply_user
	use test || rm ${PN}-tests.asd tests
}
