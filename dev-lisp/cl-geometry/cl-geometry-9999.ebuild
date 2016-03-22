# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp package for simple two dimensional computational geometry"
HOMEPAGE="https://github.com/Ramarren/cl-geometry"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Ramarren/cl-geometry.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/trees
	test? ( dev-lisp/vecto )
"

src_prepare() {
	use test || rm test-${PN}.lisp ${PN}-tests.asd
}
