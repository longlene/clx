# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="57138e351f7b956c9777c3ed72fa56ec03f4165d"

DESCRIPTION="Lisp to GLSL Language Translator"
HOMEPAGE="https://github.com/cbaggers/varjo"
SRC_URI="https://github.com/cbaggers/varjo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/split-sequence
	dev-lisp/alexandria
	dev-lisp/named-readtables
	dev-lisp/vas-string-metrics
	dev-lisp/fn
	dev-lisp/uiop
	dev-lisp/rtg-math
	dev-lisp/glsl-spec
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}.tests.asd tests
}
