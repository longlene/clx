# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ce2616bd2d60c8467a1fdff47763df63079433e4"

DESCRIPTION="A fast LibSVM data format reader for Common Lisp"
HOMEPAGE="https://github.com/masatoi/cl-libsvm-format"
SRC_URI="https://github.com/masatoi/cl-libsvm-format/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org
}
