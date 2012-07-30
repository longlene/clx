# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="FakeTime Preload Library"
HOMEPAGE="http://www.code-wizards.com/projects/libfaketime/"
SRC_URI="http://www.code-wizards.com/projects/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_compile() {
	sed -i 's:${CC}:$(CC) $(CFLAGS):;
		s:\(soname,libfaketime\.so\)\.1:\1:' Makefile
	emake libs || die "make lib failed"
}

src_install() {
	dolib libfaketime.so.1
	dolib libfaketimeMT.so.1
	dobin faketime
	dodoc README
	dodoc Changelog
	doman faketime.1
}
