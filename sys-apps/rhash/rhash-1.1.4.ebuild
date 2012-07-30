# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Recursive Hasher is a console utility for computing and verifying hash sums of files"
HOMEPAGE="http://rhash.anz.ru/"
SRC_URI="http://rhash.anz.ru/bin/${P}-src.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""

src_unpack() {
	unpack ${A}
	sed -i 's/\(LDFLAGS = \)-s /\1/' "${S}"/Makefile || die "patching Makefile"
}

src_compile() {
	emake OPTFLAGS="${CFLAGS} -DNDEBUG" || die "compile failed"
}

src_install() {
	emake install DESTDIR="${D}" PREFIX=/usr || die "install failed"
	dodoc ChangeLog || die "dodoc failed"
}
