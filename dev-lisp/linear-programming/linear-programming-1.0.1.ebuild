# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="A Common Lisp library for solving linear programming problems"
HOMEPAGE="https://github.com/neil-lindquist/linear-programming"
SRC_URI="https://github.com/neil-lindquist/linear-programming/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lisp/iterate
	dev-lisp/alexandria
	dev-lisp/alexandria
"

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}
