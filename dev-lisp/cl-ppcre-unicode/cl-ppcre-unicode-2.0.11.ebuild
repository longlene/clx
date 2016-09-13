# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit common-lisp-3

MY_P=cl-ppcre-${PV}

DESCRIPTION="CL-PPCRE is a portable regular expression library for Common Lisp."
HOMEPAGE="http://weitz.de/cl-ppcre/
		  http://www.cliki.net/cl-ppcre"
SRC_URI="https://github.com/edicl/cl-ppcre/archive/v${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="=dev-lisp/cl-ppcre-${PV}*
		dev-lisp/cl-unicode"

S="${WORKDIR}"/${MY_P}

src_install() {
	common-lisp-install ${PN}.asd ${PN}/ test/unicode*
	common-lisp-symlink-asdf
	dodoc CHANGELOG
	dohtml doc/index.html
}
