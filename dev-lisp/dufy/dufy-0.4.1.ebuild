# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Color Library for Common Lisp"
HOMEPAGE="https://github.com/privet-kitty/dufy"
SRC_URI="https://github.com/privet-kitty/dufy/archive/v0.1.1.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/alexandria
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.{asd,lisp}
}
