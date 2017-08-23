# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9c7357f76b88ce53aa188ff04fbbb492462814c8"

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
	dev-lisp/yason
	dev-lisp/cl-ppcre
	test? ( dev-lisp/stefil )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed '/defsystem\ :graph-test/,$d' -i ${PN}.asd
		sed '/defsystem\ :graph-matrix-test/,$d' -i ${PN}-matrix.asd
		rm -r test
	fi
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all COPYING
}
