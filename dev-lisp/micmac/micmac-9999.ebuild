# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp implementation of various AI/statistics related things"
HOMEPAGE="https://github.com/melisgl/micmac"
SRC_URI=""

EGIT_REPO_URI="https://github.com/melisgl/micmac.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/mgl-pax
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd test
}
