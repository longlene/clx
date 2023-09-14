# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ccb11c60e38c72dc2cede31e739b526d7d331283"

DESCRIPTION="A 2D plotting library for Common Lisp using Matplotlib"
HOMEPAGE="https://github.com/koji-kojiro/matplotlib-cl"
SRC_URI="https://github.com/koji-kojiro/matplotlib-cl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/alexandria
	dev-lisp/burgled-batteries
	dev-python/matplotlib
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
