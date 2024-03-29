# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="A simple directed graph implementation for Common Lisp"
HOMEPAGE="https://github.com/sjl/cl-digraph"
SRC_URI="https://github.com/sjl/cl-digraph/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-dot
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}.test.asd test
}
