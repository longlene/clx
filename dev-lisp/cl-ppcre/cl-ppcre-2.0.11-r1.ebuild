# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit common-lisp-2

DESCRIPTION="CL-PPCRE is a portable regular expression library for Common Lisp."
HOMEPAGE="http://weitz.de/cl-ppcre/
		  http://www.cliki.net/cl-ppcre"
SRC_URI="https://github.com/edicl/cl-ppcre/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="dev-lisp/flexi-streams"
PDEPEND="dev-lisp/cl-ppcre-unicode"

src_prepare() {
	rm -rf cl-ppcre-unicode test/unicode*
}

src_install() {
	common-lisp-install *.lisp ${PN}.asd test/
	common-lisp-symlink-asdf
	dodoc CHANGELOG
	dohtml doc/index.html
}
