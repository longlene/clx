# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cf871652e1798e4bfc664671df2734f12d379d53"

DESCRIPTION="Elegant code generation for high-performance computing"
HOMEPAGE="https://github.com/marcoheisig/Petalisp"
SRC_URI="https://github.com/marcoheisig/Petalisp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/agnostic-lizard
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
	dev-lisp/lparallel
	dev-lisp/trivia
	dev-lisp/trivial-arguments
	dev-lisp/closer-mop
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test-suite.asd ${PN}-development.asd test-suite development examples
}