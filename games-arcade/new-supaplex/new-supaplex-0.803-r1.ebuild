# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-arcade/new-supaplex/new-supaplex-0.721.ebuild, v1 2010/11/30 20:18:30 oschtan Exp $

EAPI=7
inherit eutils games toolchain-funcs

DESCRIPTION="Clone of the game Supaplex"
HOMEPAGE="http://www.newsupaplex.pp.ru/sup_news_eng.html"
SRC_URI="amd64? ( http://oschtan.academ.org/distfiles/newsupaplex803_linux_amd64.tar.gz )
	x86? ( http://oschtan.academ.org/distfiles/newsupaplex803_linux_i386.tar.gz )
	http://www.newsupaplex.pp.ru/levels.zip
	demos? ( http://www.newsupaplex.pp.ru/files/demos/00.zip 
		 http://www.newsupaplex.pp.ru/files/demos/01.zip
		http://www.newsupaplex.pp.ru/files/demos/02.zip
		http://www.newsupaplex.pp.ru/files/demos/03.zip
		http://www.newsupaplex.pp.ru/files/demos/04.zip
		http://www.newsupaplex.pp.ru/files/demos/05.zip
		http://www.newsupaplex.pp.ru/files/demos/06.zip
		http://www.newsupaplex.pp.ru/files/demos/07.zip
		http://www.newsupaplex.pp.ru/files/demos/08.zip
		http://www.newsupaplex.pp.ru/files/demos/09.zip
		http://www.newsupaplex.pp.ru/files/demos/10.zip
		http://www.newsupaplex.pp.ru/files/demos/11.zip
		http://www.newsupaplex.pp.ru/files/demos/12.zip
		http://www.newsupaplex.pp.ru/files/demos/77.zip
		http://www.newsupaplex.pp.ru/files/demos/78.zip
		http://www.newsupaplex.pp.ru/files/demos/92.zip
		http://www.newsupaplex.pp.ru/files/demos/93.zip
		http://www.newsupaplex.pp.ru/files/demos/94.zip
		http://www.newsupaplex.pp.ru/files/demos/95.zip
		http://www.newsupaplex.pp.ru/files/demos/96.zip
		http://www.newsupaplex.pp.ru/files/demos/97.zip
		http://www.newsupaplex.pp.ru/files/demos/98.zip )"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="demos"

DEPEND="virtual/opengl
	media-libs/libbass-bin
	media-libs/jpeg:62
	media-libs/libpng:1.2
	>=sys-devel/gcc-4.4.2
	x11-libs/libX11
	x11-libs/libxcb"

RDEPEND="app-arch/unzip"

S=${WORKDIR}/NewSupaplex

NEW_SUPAPLEX_HOME=/usr/share/new-supaplex

DOCS="README"

QA_TEXTRELS="usr/share/new-supaplex/Lib/libclanGL.so.1
usr/share/new-supaplex/Lib/libclanCore.so.1
usr/share/new-supaplex/Lib/libclanSignals.so.1
usr/share/new-supaplex/Lib/libclanGUIStyleSilver.so.1
usr/share/new-supaplex/Lib/libclanDisplay.so.1
usr/share/new-supaplex/Lib/libclanApp.so.1
usr/share/new-supaplex/Lib/libclanGUI.so.1
usr/share/new-supaplex/NewSupaplexX"

src_prepare() {
	cd "${S}"
	rm Lib/libbass.so
	rm Lib/libjpeg.so.62
	rm Lib/libpng12.so.0
	mv readme.txt README
	cp Graphics/Objects/murphy.png supaplex.png
}


src_compile() {
        echo
        einfo "Nothing to compile."
        echo
}

src_install() {
	rm "${S}"/run.sh
	doicon ${S}/supaplex.png
	rm "${S}"/supaplex.png
	domenu ${FILESDIR}/newsupaplex.desktop
	dobin ${FILESDIR}/newsupaplex
	dodoc ${S}/README
	rm "${S}"/README
	chmod ugo+w "${S}"/Players
	dodir ${NEW_SUPAPLEX_HOME}
        cp -rp "${S}"/* ${D}${NEW_SUPAPLEX_HOME}
	cp -rp ${WORKDIR}/L* ${D}${NEW_SUPAPLEX_HOME}/Levels
	if use demos ; then
		cp -rp ${WORKDIR}/*.sp ${D}${NEW_SUPAPLEX_HOME}/Demos 
		cp -rp ${WORKDIR}/*.SP ${D}${NEW_SUPAPLEX_HOME}/Demos
	fi
}

src_postinstall() {
	chmod ugo+w "${S}"/Players
}
