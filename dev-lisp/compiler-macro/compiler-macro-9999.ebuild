# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="CL compiler macro utilities"
HOMEPAGE="https://github.com/Bike/compiler-macro"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Bike/compiler-macro.git"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/introspect-environment
"

src_prepare() {
	eapply_user
	use test || rm -rf test ${PN}-test.asd
}
