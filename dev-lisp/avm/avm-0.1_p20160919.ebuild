# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3

EGIT_COMMIT="0f42fa59eed6a7722b1002b00428be5d21e1caa9"

DESCRIPTION="Efficient and expressive arrayed vector math library with multi-threading and CUDA support in Common Lisp"
HOMEPAGE="https://github.com/takagi/avm"
SRC_URI="https://github.com/takagi/avm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-tuples
	dev-lisp/cl-pattern
	dev-lisp/cl-unification
	dev-lisp/cl-cuda
	dev-lisp/bordeaux-threads
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -rf t ${PN}-test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
