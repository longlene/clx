# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="10d8fa06b9c5256e0ef840cf26bb1eb80d853ef2"

DESCRIPTION="Fast, flexible, designer-friendly templates for Common Lisp"
HOMEPAGE="https://github.com/eudoxia0/eco"
SRC_URI="https://github.com/eudoxia0/eco/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/esrap
	dev-lisp/split-sequence
	dev-lisp/cl-who
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
