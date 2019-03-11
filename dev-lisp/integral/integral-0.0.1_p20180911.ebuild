# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0ad6ed0de47e538ad1fb60c914f2facf137e2309"

DESCRIPTION="An object relational mapper for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/integral"
SRC_URI="https://github.com/fukamachi/integral/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-annot
	dev-lisp/sxql
	dev-lisp/cl-dbi
	dev-lisp/cl-ppcre
	dev-lisp/closer-mop
	dev-lisp/clos-fixtures
	dev-lisp/split-sequence
	dev-lisp/group-by
	dev-lisp/iterate
	dev-lisp/alexandria
	dev-lisp/trivial-types
	test? ( dev-lisp/prove )
"

src_prepare() {
	default
	use test || rm ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
