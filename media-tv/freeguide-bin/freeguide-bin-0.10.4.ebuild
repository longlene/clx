# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit rpm

IUSE=""

DESCRIPTION="Displays TV listings"
HOMEPAGE="http://freeguide-tv.sourceforge.net"
SRC_URI="mirror://sourceforge/freeguide-tv/freeguide-${PV}-1.noarch.rpm"
#SRC_URI="http://freeguide-tv.sourceforge.net/freeguide-${PV}-1.noarch.rpm"
#SRC_URI="http://freeguide-tv.sourceforge.net/rc/freeguide-${PV}-1.noarch.rpm"

KEYWORDS="~x86"
LICENSE="GPL-2"
SLOT="0"

RDEPEND=">=virtual/jre-1.4
	>=media-tv/xmltv-0.5.37-r1
"

INSTALLDIR="/usr/share/freeguide/"
S=${WORKDIR}

src_install() {
	dodir ${INSTALLDIR}
	cp -R ${S}/usr/share/freeguide/* ${D}/${INSTALLDIR}/ || die "installing freeguide libs failed"
	chmod og+rx ${D}/${INSTALLDIR}/lib
	
	sed 's/\/usr\/share\/doc\/freeguide/\/usr\/share\/doc\/freeguide-bin-${PV}\/html/' ${S}/usr/bin/freeguide > ${S}/freeguide
	dobin ${S}/freeguide || die "installing executable failed"
	
	doman ${S}/usr/share/man/man1/freeguide.1.gz
	
	dohtml -r ${S}/usr/share/doc/freeguide/*
	
	for res in 16 32 48 64 72 96; do
		insinto /usr/share/icons/hicolor/${res}x${res}/apps
		newins ${S}/usr/share/pixmaps/freeguide/logo-${res}x${res}.png \
				freeguide.png
	done
	cp ${S}/usr/share/pixmaps/freeguide.png ${S}/freeguide.png
	doicon ${S}/freeguide.png
	
	make_desktop_entry freeguide FreeGuide freeguide.png || die "failed creating desktop menu entry"
}
