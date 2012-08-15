# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit common-lisp-3 multilib

DESCRIPTION="Portable FFI library for Common Lisp."
HOMEPAGE="http://uffi.b9.com/"
SRC_URI="http://files.b9.com/uffi/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="doc"

src_prepare() {
	rm -f tests/*dylib
}

src_install() {
	common-lisp-install-sources src
	common-lisp-install-sources -t all tests
	common-lisp-install-asdf

	dodoc AUTHORS ChangeLog NEWS README TODO

	if use doc ; then
		dodoc doc/uffi.pdf

		tar xfz doc/html.tar.gz -C "${T}"
		dohtml "${T}"/html/*

		docinto benchmarks && dodoc benchmarks/*.lisp
		docinto examples && dodoc examples/*.{lisp,c}
	fi
}
