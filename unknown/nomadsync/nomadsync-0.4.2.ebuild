# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

S=${WORKDIR}/${PN}

IUSE=""

inherit wxwidgets

DESCRIPTION="This utility allows you to keep the MP3 collection on your Jukebox synchronised with the MP3s on your PC."
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
HOMEPAGE="http://nomadsync.sourceforge.net/"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"

DEPEND=">=media-libs/libnjb-2.0_pre20050208
	x11-libs/wxGTK
	media-libs/id3lib"

RDEPEND="${DEPEND}"

src_compile() {
	sed -i -e 's/\/usr\/local\/lib\/libnjb.so/\/usr\/lib\/libnjb.so/' ${S}/src/Makefile.am
	WX_GTK_VER="2.6"
	need-wxwidgets gtk
	econf \
		--libdir=/usr/lib64 \
		--with-wx-config=${WX_CONFIG} \
		--with-wxbase-config=${WX_CONFIG} || die "configure failed"
        emake || die "make failed"
}

src_install() {
	#Fix nomadsync.desktop part1
	sed -i -e 's/gnomad2/nomadsync/' src/nomadsync.desktop
	sed -i -e 's/..\/doc\/camelHead.png/camelHead/' src/nomadsync.desktop
	
	make DESTDIR=${D} install

	#Copyng doc folder
	mkdir -p ${D}/usr/share/doc/${PF}
	cp -R ${WORKDIR}/${PN}/doc ${D}/usr/share/doc/${PF}

	#Nomadsync pixmaps
	mkdir -p ${D}/usr/share/pixmaps
	ln -s ${D}/usr/share/doc/${PF}/doc/camelHead.png  ${D}/usr/share/pixmaps
	
	#Fix nomadsync.desktop part 2
	mkdir -p ${D}/usr/share/applications/
	mv ${D}/Utilities/nomadsync.desktop ${D}/usr/share/applications/
	rm -fr ${D}/Utilities

	dodoc authors ChangeLog copying news readme todo
}
