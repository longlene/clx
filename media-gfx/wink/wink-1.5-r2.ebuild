# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A flash,pdf and html tutorial and presentation creation program"
HOMEPAGE="http://www.debugmode.com/wink"
MY_P="${P/-/}"
MY_P="${MY_P/./}"
SRC_URI="http://debugmode.com/wink/${MY_P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=">=x11-libs/gtk+-2.4"

src_unpack(){
	unpack ${MY_P}.tar.gz
	DISTDIR="${WORKDIR}"
	unpack installdata.tar.gz
}

src_compile(){
	echo
	einfo "Binary Package - nothing to compile!"
	echo
}

src_install(){
	INSTDIR=/opt/${PN}
	dodir ${INSTDIR} /usr/bin /usr/share/pixmaps
	
	# create wink shellscript
	echo -e "#!/bin/bash\nWINK_INSTALL_DIR=${INSTDIR}\n${INSTDIR}/wink" > wink
	dobin wink	
	
	# extract icon
	ICON='winkcust.xrs$winkicon.png'
	unzip  ${WORKDIR}/Resources/winkcust.xrs $ICON
	mv $ICON ${D}/usr/share/pixmaps/wink.png

	cd ${WORKDIR}
	
	mv Backgrounds Buttons Callouts FlashControlBars FlashPreloaders Resources Samples Templates Docs wink ${D}/${INSTDIR}

	# So we can create file tutorials from the program (Help / View Tutorials 1 & 2)
	fowners root:users ${INSTDIR}/Samples
	fperms 770 ${INSTDIR}/Samples
	
	dodoc changelog.txt license.txt readme.txt 
	make_desktop_entry wink Wink wink.png Graphics
}
