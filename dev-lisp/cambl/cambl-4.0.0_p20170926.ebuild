# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="800343aab1f15b2a684f5a85cb1382b9753e6166"

DESCRIPTION="Common Lisp library for working with commoditized amounts and balances"
HOMEPAGE="https://github.com/jwiegley/cambl"
SRC_URI="https://github.com/jwiegley/cambl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-containers
	dev-lisp/local-time
	dev-lisp/periods
	dev-lisp/fprog
	dev-lisp/alexandria
	test? ( dev-lisp/xlunit )
"

src_prepare() {
	eapply_user
	use test || rm ${PN}-test.asd ${PN}-test.lisp
}
