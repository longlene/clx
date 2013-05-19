# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $ 

DESCRIPTION="A MIPS R2000 educational assembler"
HOMEPAGE="http://r2000asm.sourceforge.net"
SRC_URI="mirror://sourceforge.net/r2000asm/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE="debug profile"

DEPEND=""
RDEPEND=""

src_compile() {
	local myconf=""
	use debug && myconf="${myconf} --enable-debug"
	use profile && myconf="${myconf} --enable-profile"
	econf $myconf || die "Configuration failed"
	emake -j1 || die "Make failed"
}	

src_install() {
	make install DESTDIR=${D} || die "Install failed"
	dodoc AUTHORS BUGS COPYING ChangeLog NEWS README INSTALL
}	
	

