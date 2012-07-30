# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

DESCRIPTION="Slackware Extra Console Fonts"
HOMEPAGE="http://www.slackware.com/"
#SRC_URI="mirror://sourceforge/fixme/${P}.tar.gz"

SRC_URI="http://slackware.cs.utah.edu/pub/slackware/slackware-13.0/source/a/kbd/sources/extraf.tgz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="amd64 arm ia64 ppc s390 sh sparc x86"
IUSE=""

src_unpack() {
	dodir ${WORKDIR}
	tar zxvf ${DISTDIR}/extraf.tgz --strip-components 4 -C ${WORKDIR}
}

src_install() {
	dodir /usr/share/consolefonts
	insinto /usr/share/consolefonts
	doins *
}
