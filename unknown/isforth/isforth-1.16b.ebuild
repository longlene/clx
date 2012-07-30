# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/xmms-nsf/xmms-nsf-0.0.3.ebuild,v 1.15 2005/09/09 11:30:29 flameeyes Exp $

IUSE=""

DESCRIPTION="IsForth is an attempt to produce a true Forth for Linux"
HOMEPAGE="http://isforth.clss.net"
SRC_URI="http://isforth.clss.net/${P}.tgz"

LICENSE="LGPL-2.1"
SLOT="0"
#-sparc: 0.0.3: Plays, but not completely... misses notes
KEYWORDS="x86"

DEPEND="dev-lang/nasm"

src_compile() {
   emake clean || die "emake failed"
   emake || die "emake failed"
   ./extend
}

src_install() {
	dobin isforth || die
	dodoc Changelog License readme todo
}
