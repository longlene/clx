# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="MGL-GPR is a library of evolutionary algorithms"
HOMEPAGE="https://github.com/melisgl/mgl-gpr"
SRC_URI=""

EGIT_REPO_URI="https://github.com/melisgl/mgl-gpr.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-random
	dev-lisp/mgl-pax
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd test example
}
