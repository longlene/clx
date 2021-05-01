# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3

EGIT_COMMIT="2278641e5f271f936e7b7025a8da69ae985f455c"

DESCRIPTION="Common Lisp Typesetting system"
HOMEPAGE="https://github.com/mbattyani/cl-typesetting"
SRC_URI="https://github.com/mbattyani/cl-typesetting/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-pdf
	test? ( dev-lisp/cl-typegraph )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd test.lisp
}
