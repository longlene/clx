# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Apple ][+ emulator"
HOMEPAGE="http://stephane.vaillant.free.fr/reapple2.html"
SRC_URI="http://stephane.vaillant.free.fr/pub/${P}.tgz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="-amd64 x86"
IUSE=""

DEPEND="dev-lang/ocaml
	sys-libs/zlib"
RDEPEND=""

src_compile() {
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die

	dodoc README.TXT doc/keys.txt doc/manual.txt doc/options.txt doc/roadmap.txt
	insinto /usr/share/reapple2 && doins rom/*
}
