# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit common-lisp-2

DESCRIPTION="Hyperobject is a Common Lisp library for representing objects."
HOMEPAGE="http://hyperobject.b9.com/
		http://www.cliki.net/hyperobject"
SRC_URI="http://files.b9.com/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE="doc"

RDEPEND="!dev-lisp/cl-${PN}
		dev-lisp/kmrcl
		dev-lisp/rt
		dev-lisp/clsql"

src_unpack() {
	unpack ${A}
	tar xfz "${S}"/doc/html.tar.gz -C "${WORKDIR}"
}

src_prepare() {
	rm Makefile
}

src_install() {
	common-lisp-install *.{lisp,asd} examples
	common-lisp-symlink-asdf
	dodoc README
	use doc && dohtml -r "${WORKDIR}"/html/
}
