# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_COMMIT="8a6c4f5c2d48d5f53d49a5995e9a1460c794240e"

DESCRIPTION="Common Lisp implementation of delta debugging"
HOMEPAGE="https://github.com/eschulte/delta-debug"
SRC_URI="https://github.com/eschulte/delta-debug/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/named-readtables
	dev-lisp/curry-compose-reader-macros
	dev-lisp/metabang-bind
	dev-lisp/diff
	dev-lisp/trivial-shell
	dev-lisp/split-sequence
	test? ( dev-lisp/stefil )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem "delta-debug/test/,$d' ${PN}.asd
		rm delta-debug-test.lisp
	fi
}
