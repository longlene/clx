# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="LALR(1) parser generator for Common Lisp"
HOMEPAGE="https://www.irif.fr/~jch/software/cl-yacc/"
SRC_URI="https://www.irif.fr/~jch/software/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DOCS=( CHANGES README cl-yacc.texi )

src_prepare() {
	default
	# only yacc.lisp belongs to the "yacc" ASDF system; keep the tests out
	# of the installed sources and ship the calculator as an example
	rm yacc-tests.lisp || die
	mkdir examples || die
	mv calculator.lisp examples/ || die
}

src_install() {
	common-lisp-install-sources yacc.lisp
	common-lisp-install-asdf yacc.asd
	einstalldocs
	dodoc -r examples
}
