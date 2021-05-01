# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c334e50d18d55318a693e6857e68df12d0aefc89"

DESCRIPTION="Tools for writing optimized bit-vector routines"
HOMEPAGE="https://github.com/guicho271828/bit-ops"
SRC_URI="https://github.com/guicho271828/bit-ops/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/alexandria
	dev-lisp/trivia
	dev-lisp/immutable-struct
	dev-lisp/lisp-namespace
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}.test.asd t
}
