# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="188bf6c3b7a78383c2707154c0bd19b2a4d88a07"

DESCRIPTION="Linear Algebra in Common Lisp"
HOMEPAGE="https://github.com/OdonataResearchLLC/linear-algebra"
SRC_URI="https://github.com/OdonataResearchLLC/linear-algebra/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/floating-point
	test? ( dev-lisp/lisp-unit )
"

src_prepare() {
	eapply_user
	use test || rm -rf test
	use doc || rm -rf reference
}
