# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit common-lisp-3

DESCRIPTION="Common Lisp library for pipes or streams."
HOMEPAGE="http://uffi.b9.com/"
SRC_URI="http://files.kpe.io/${PN}/${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="dev-lisp/ptester"

src_install() {
	common-lisp-install *.lisp ${PN}.asd
	common-lisp-symlink-asdf
	dodoc COPYING


	#if use doc ; then
	#	dodoc doc/uffi.pdf

	#	tar xfz doc/html.tar.gz -C "${T}"
	#	dohtml "${T}"/html/*

	#	docinto benchmarks && dodoc benchmarks/*.lisp
	#	docinto examples && dodoc examples/*.{lisp,c}
	#fi
}
