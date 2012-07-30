# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-action/yofrankie/yofrankie-1.1b.ebuild, v1 2010/07/28 09:57:30 oschtan Exp $

EAPI=2
inherit eutils games python

DESCRIPTION="Open video game made by the Blender Institute"
HOMEPAGE="http://www.yofrankie.org/"
SRC_URI="http://download.blender.org/apricot/yofrankie_1_1b_bge.zip
	http://www.graphicall.org/ftp/ideasman42/yofrankie_1_1b_bge.zip"

LICENSE="CCPL-Attribution-ShareAlike-NonCommercial-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lang/python
	 media-gfx/blender[blender-game,ffmpeg,openal]
	 media-libs/jpeg:62
	 media-libs/libsdl[aalib]
	 sys-libs/slang
	 virtual/opengl
	 x11-libs/libX11[xcb]"
DEPEND="${RDEPEND}
        app-arch/unzip"

S=${WORKDIR}/yofrankie_1_1b_bge
YOFRANKIE_HOME=/usr/share/yofrankie-bge

src_unpack() {
        unpack yofrankie_1_1b_bge.zip
	echo
        ewarn "If you are using <media-gfx/blender-2.49a, graphic performance will be significantly lower."
	ewarn "Need a blender-2.49a and higher"
	echo
}

src_prepare() {
	cd "${S}"
	rm -rf yofrankie-win32/
	mv dist/yofrankie.png dist/yofrankie-bge.png
	
	if use x86 ; then
		rm yofrankie-linux-x86_64.bin
        fi

	if use amd64 ; then
                rm yofrankie-linux-i386.bin
        fi
}


src_compile() {
        echo
        einfo "Nothing to compile."
        echo
}

src_install() {
	rm "${S}"/Makefile
	rm "${S}"/README.TXT
	doicon ${S}/dist/yofrankie-bge.png
	domenu ${S}/dist/yofrankie-bge.desktop
	dobin ${S}/dist/yofrankie-bge
	rm -rf "${S}"/dist/
	dodir ${YOFRANKIE_HOME}
        cp -rp "${S}"/* ${D}${YOFRANKIE_HOME}
}

pkg_postinst() {
        python_mod_optimize ${YOFRANKIE_HOME}/chars/frankie_scripts
	python_mod_optimize ${YOFRANKIE_HOME}/chars/sheep_scripts
	python_mod_optimize ${YOFRANKIE_HOME}/effects/effects_scripts
	python_mod_optimize ${YOFRANKIE_HOME}/hud/hud_scripts
	python_mod_optimize ${YOFRANKIE_HOME}/levels/level_scripts
	python_mod_optimize ${YOFRANKIE_HOME}/levels/menu_scripts
	python_mod_optimize ${YOFRANKIE_HOME}/levels/selector_scripts
}

pkg_postrm() {
        python_mod_cleanup ${YOFRANKIE_HOME}/chars/frankie_scripts
        python_mod_cleanup ${YOFRANKIE_HOME}/chars/sheep_scripts
        python_mod_cleanup ${YOFRANKIE_HOME}/effects/effects_scripts
        python_mod_cleanup ${YOFRANKIE_HOME}/hud/hud_scripts
        python_mod_cleanup ${YOFRANKIE_HOME}/levels/level_scripts
        python_mod_cleanup ${YOFRANKIE_HOME}/levels/menu_scripts
        python_mod_cleanup ${YOFRANKIE_HOME}/levels/selector_scripts
}
