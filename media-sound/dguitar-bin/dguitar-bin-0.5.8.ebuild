# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils versionator

DESCRIPTION="DGuitar is a Guitar Pro (*.GP4,*.GP3,*.GTP) viewer and player"
HOMEPAGE="http://dguitar.sourceforge.net/"
SRC_URI="mirror://sourceforge/dguitar/DGuitar-$PV.zip"
LICENSE="GPL-2"
SLOT="0"

KEYWORDS="~x86"

RDEPEND=">=virtual/jre-1.4"
DEPEND="${RDEPEND}"

IUSE="samples"

MY_TARGET="/usr/lib/${PN}"
S=$WORKDIR/DGuitar-${PV}
src_compile() {
	echo "#!/bin/bash" > ${WORKDIR}/${PN}
	echo "# DGuitar start script" >> ${WORKDIR}/${PN}
	echo "cd ${MY_TARGET}" >> ${WORKDIR}/${PN}
	echo "java -jar dist/DGuitar.jar \"\$@\"" >> ${WORKDIR}/${PN}
}

src_install() {
	dodoc EFFECTS.TXT \
		README.TXT \
		LANGUAGES.TXT \
		EFFECTS.TXT \
		TODO.TXT

	insinto ${MY_TARGET}
	doins -r \
		dist \
		lang \
		skins

	rm ${D}/${MY_TARGET}/skins/Thumbs.db \
	${D}/${MY_TARGET}/skins/*/Thumbs.db &> /dev/null

	if use samples; then
		insinto ${MY_TARGET}/files
		doins files/*
	fi

	dobin ${WORKDIR}/${PN}

	cp skins/dguitar_32x32.png \
	${PN}.png
	doicon ${PN}.png
	make_desktop_entry ${PN} ${PN} ${PN}.png
}
