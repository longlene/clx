# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="71ea6974bf0a5b58a3cfb1fd6c9f4aa00ee57e84"

DESCRIPTION="Simple graph data structure and algorithms"
HOMEPAGE="http://eschulte.github.io/graph"
SRC_URI="https://github.com/eschulte/graph/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/metabang-bind
	dev-lisp/curry-compose-reader-macros
	dev-lisp/femlisp
	dev-lisp/cl-ppcre
	dev-lisp/yason
	test? ( dev-lisp/stefil )
"

src_prepare() {
	eapply_user
	use test || rm matrix-test.lisp test.lisp
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all COPYING
}
