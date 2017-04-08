# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

DESCRIPTION="Usocket is a universal socket library for Common Lisp."
HOMEPAGE="http://common-lisp.net/project/usocket/"
SRC_URI="http://common-lisp.net/project/${PN}/releases/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	dev-lisp/split-sequence
	dev-lisp/portable-threads
	test? ( dev-lisp/rt )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd test
}
