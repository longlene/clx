# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit common-lisp-3

DESCRIPTION="A Common Lisp library to help automate clock and divisor selections for microcontrollers."
HOMEPAGE="http://uffi.b9.com/"
SRC_URI="http://files.kpe.io/cluck/${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="dev-lisp/kmrcl"

src_install() {
	common-lisp-install *.lisp ${PN}.asd
	common-lisp-symlink-asdf
	dodoc ${PN}.txt


	#if use doc ; then
	#	dodoc doc/uffi.pdf

	#	tar xfz doc/html.tar.gz -C "${T}"
	#	dohtml "${T}"/html/*

	#	docinto benchmarks && dodoc benchmarks/*.lisp
	#	docinto examples && dodoc examples/*.{lisp,c}
	#fi
}
