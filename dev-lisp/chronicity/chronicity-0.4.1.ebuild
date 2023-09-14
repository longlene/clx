# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3

DESCRIPTION="A natural language date and time parser for Common Lisp"
HOMEPAGE="http://chaitanyagupta.com/lisp/chronicity"
SRC_URI="https://github.com/chaitanyagupta/chronicity/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/cl-interpol
	dev-lisp/local-time
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd test
}
