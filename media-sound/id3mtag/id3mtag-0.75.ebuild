# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/id3/id3-0.12-r1.ebuild,v 1.16 2004/09/29 03:33:52 tgall Exp $

IUSE=""

DESCRIPTION="command line id3v2.3/id3v1.1 tagger for mp3 files"
HOMEPAGE="http://home.wanadoo.nl/squell/id3.html"
S="${WORKDIR}/id3-${PV}"
SRC_URI="http://home.wanadoo.nl/squell/files/id3-${PV}.tar.gz"

LICENSE="Cryptix/BSD"
SLOT="0"
KEYWORDS="~x86"

src_compile() {
	make CFLAGS="${CFLAGS}" || die
}

src_install() {
	dodoc README
	newman id3.man id3mtag.1
	newbin id3 id3mtag
}
