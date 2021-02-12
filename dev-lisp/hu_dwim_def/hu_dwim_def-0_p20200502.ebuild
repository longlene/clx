# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a01fabfbe18c5756aa40444555a4e625cc8aa064"

DESCRIPTION="General purpose, homogenous, extensible definer macro"
HOMEPAGE="http://dwim.hu/project/hu.dwim.def"
SRC_URI="http://github.com/hu-dwim/hu.dwim.def/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hu_dwim_asdf
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/iterate
	dev-lisp/metabang-bind
"

src_prepare() {
	default
	use test || rm -r hu.dwim.def.test.asd test
}
