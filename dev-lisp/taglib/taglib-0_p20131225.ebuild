# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7ba5488cf391c6208309277e421a212436593242"

DESCRIPTION=""
HOMEPAGE="https://github.com/mv2devnul/taglib/"
SRC_URI="https://github.com/mv2devnul/taglib/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/optima
	dev-lisp/flexi-streams
	dev-lisp/bordeaux-threads
	test? (
			dev-lisp/cl-fad
			dev-lisp/chanl
		  )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-tests.asd ${PN}-tests.lisp
}
