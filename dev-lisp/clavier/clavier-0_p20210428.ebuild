# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="048bea40cac0a89480f8c41ae542be45945f3268"

DESCRIPTION="General purpose validation library for Common Lisp"
HOMEPAGE="https://github.com/mmontone/clavier"
SRC_URI="https://github.com/mmontone/clavier/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/closer-mop
	dev-lisp/chronicity
	dev-lisp/cl-fad
	test? ( dev-lisp/stefil )
"

src_prepare() {
	default
	use test || rm ${PN}.test.asd test.lisp
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
