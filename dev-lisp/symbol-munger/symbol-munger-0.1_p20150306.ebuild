# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="97598d4c3c53fd5da72ab78908fbd5d8c7a13416"

DESCRIPTION="a common lisp library to help convert english and lisp-symbols into each other and various formats"
HOMEPAGE="https://github.com/AccelerationNet/symbol-munger"
SRC_URI="https://github.com/AccelerationNet/symbol-munger/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/alexandria
	test? ( dev-lisp/lisp-unit2 )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem\ :symbol-munger-test/,$d' ${PN}.asd
		rm -r tests
	fi
}
