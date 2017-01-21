# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7215d5d4719697ba2de890f0e2d504029e95bf95"

DESCRIPTION="common lisp gesture recognition"
HOMEPAGE="https://github.com/3b/recognize"
SRC_URI="https://github.com/3b/recognize/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	example? ( dev-lisp/glop dev-lisp/cl-opengl )
"

src_prepare() {
	eapply_user
	use example || rm -rf ${PN}-demo.asd demo
}
