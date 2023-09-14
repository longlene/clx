# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="065b48db353e94df50eb9b6c3d5d72a501a7b0ee"

DESCRIPTION="Deep Learning in Common Lisp"
HOMEPAGE="https://github.com/Rudolph-Miller/cldl"
SRC_URI="https://github.com/Rudolph-Miller/cldl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-syntax
	dev-lisp/alexandria
	dev-lisp/closer-mop
	test? ( dev-lisp/prove dev-lisp/split-sequence )
"

src_prepare() {
	eapply_user
	use test || rm -r t ${PN}-test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
