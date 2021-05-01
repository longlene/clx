# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b9bfd93508095c3b89a14baea8380e2c691544bd"

DESCRIPTION="Numerical utilities"
HOMEPAGE="https://github.com/tpapp/cl-num-utils"
SRC_URI="https://github.com/tpapp/cl-num-utils/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/anaphora
	dev-lisp/alexandria
	dev-lisp/array-operations
	dev-lisp/cl-slice
	dev-lisp/let-plus
	test? ( dev-lisp/clunit )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem #:cl-num-utils-tests/,$d' ${PN}.asd
		rm -r tests
	fi
}
