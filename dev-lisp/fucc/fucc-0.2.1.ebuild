# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lisp/cl-fucc/cl-fucc-0.1.1.ebuild,v 1.1 2006/07/24 03:24:00 mkennedy Exp $

EAPI=4
inherit common-lisp

DESCRIPTION="fucc is universal parser generator for Common Lisp."
HOMEPAGE="http://common-lisp.net/project/fucc/"
SRC_URI="http://common-lisp.net/project/fucc/files/fucc_0.2.1-alpha-20080624.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
#KEYWORDS="~amd64 ~ppc ~sparc ~x86"
KEYWORDS=""
IUSE=""
SLOT="0"
DEPEND="virtual/commonlisp"

S=${WORKDIR}/fucc_${PV}

CLPACKAGE="fucc-parser fucc-generator"

src_install() {
	insinto $CLSOURCEROOT/fucc; doins *.asd
	insinto $CLSOURCEROOT/fucc/parser; doins parser/*
	insinto $CLSOURCEROOT/fucc/generator; doins generator/*
	dosym $CLSOURCEROOT/fucc/fucc-parser.asd $CLSYSTEMROOT
	dosym $CLSOURCEROOT/fucc/fucc-generator.asd $CLSYSTEMROOT
	dodoc LICENSE README
	insinto /usr/share/doc/${PF}/
	doins -r doc/*
	insinto /usr/share/doc/${PF}/examples
	doins examples/*
}
