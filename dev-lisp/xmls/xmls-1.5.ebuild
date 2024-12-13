# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit common-lisp-3

DESCRIPTION="XMLS is a small, simple, non-validating XML parser for Common Lisp."
HOMEPAGE="http://www.common-lisp.net/project/xmls/
	http://www.cliki.net/xmls"
SRC_URI="http://www.common-lisp.net/project/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 x86 ~arm"
IUSE=""

RDEPEND="!dev-lisp/cl-${PN}"

src_install() {
	common-lisp-install *.{lisp,asd}
	common-lisp-symlink-asdf
	dodoc Changelog
	dohtml README.html
	for i in ant beep cdata dav large misc namespace rdf soap xml-rpc; do
		docinto tests/${i}
		dodoc tests/${i}/*
	done
	dodoc run-tests.sh
}
