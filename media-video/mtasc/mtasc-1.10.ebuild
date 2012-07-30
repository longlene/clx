# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="open source swf compiler"
HOMEPAGE="http://www.mtasc.org/"
SRC_URI="http://www.mtasc.org/doc/mtasc/install.ml"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/ocaml
		sys-libs/zlib"

src_unpack() {
	cp ${DISTDIR}/install.ml ./ 
	sed -i -e  's:zlib\.lib:/usr/lib/libz.a:' install.ml
}

src_compile() {
	ocaml work/install.ml || die "ocaml install failed" 
}

src_install() {
	dobin ${P}/bin/mtasc
	insinto /usr/share/ocaml/mtasc/std/
	doins ${P}/ocaml/mtasc/std/*
	insinto /usr/share/ocaml/mtasc/std8/
	doins ${P}/ocaml/mtasc/std8/*
}

pkg_postinst() {
	einfo mm classes are installed in /usr/share/ocaml/mtasc/std/
	einfo so when needed you should compile with 
	einfo mtasc -cp /usr/share/ocaml/mtasc/std/ ...
}
