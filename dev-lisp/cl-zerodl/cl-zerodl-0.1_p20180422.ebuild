# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="eebb937ac4550a15dbedd8cfe92985d22cf4f63d"

DESCRIPTION="ゼロから作るDeep Learningのサンプルコード (Common Lisp版)"
HOMEPAGE="https://github.com/masatoi/cl-zerodl"
SRC_URI="https://github.com/masatoi/cl-zerodl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clgplot
	dev-lisp/mgl-mat
	dev-lisp/metabang-bind
	dev-lisp/cl-libsvm-format
	dev-lisp/alexandria
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
	rm -r example
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org
}
