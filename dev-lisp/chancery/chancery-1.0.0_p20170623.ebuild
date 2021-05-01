# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b7ae6d8be79328bbf4251fa96bcbae181dabf140"

DESCRIPTION="A text and data generation library for Common Lisp"
HOMEPAGE="https://github.com/sjl/chancery"
SRC_URI="https://github.com/sjl/chancery/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/named-readtables
	test? ( dev-lisp/1am )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}.test.asd test
}
