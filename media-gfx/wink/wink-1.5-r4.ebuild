# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit libtool

DESCRIPTION="A flash,pdf and html tutorial and presentation creation program"
HOMEPAGE="http://www.debugmode.com/wink"
MY_P="${P/-/}"
MY_P="${MY_P/./}"
EXPAT_P="expat-1.95.8"
EXPAT_S="${WORKDIR}/${EXPAT_P}"
WINK_INSTDIR=/opt/${PN}
SRC_URI="http://debugmode.com/wink/${MY_P}.tar.gz
mirror://sourceforge/expat/${EXPAT_P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=">=x11-libs/gtk+-2.4"

src_unpack(){
	unpack "${EXPAT_P}".tar.gz
	unpack ${MY_P}.tar.gz
	DISTDIR="${WORKDIR}"
	unpack installdata.tar.gz
	cd "${EXPAT_S}"
	elibtoolize
}

src_compile(){
	echo
	einfo "Compiling old expat dependency"
	echo
	cd "${EXPAT_S}"
	./configure --prefix=${WINK_INSTDIR}
	emake || die "emake failed"
}

src_install(){
	dodir ${WINK_INSTDIR} /usr/bin /usr/share/pixmaps
	
	# extract icon
	ICON='winkcust.xrs$winkicon.png'
	unzip  ${WORKDIR}/Resources/winkcust.xrs $ICON
	mv $ICON ${D}/usr/share/pixmaps/wink.png

	cd ${WORKDIR}
	
	mv Backgrounds Buttons Callouts FlashControlBars FlashPreloaders Resources Samples Templates Docs wink ${D}/${WINK_INSTDIR}

	# So we can create file tutorials from the program (Help / View Tutorials 1 & 2)
	fowners root:users ${WINK_INSTDIR}/Samples
	fperms 770 ${WINK_INSTDIR}/Samples
	
	dodoc changelog.txt license.txt readme.txt 
	# create wink shellscript
	cat > wink <<EOF
#!/bin/bash
WINK_INSTALL_DIR="${WINK_INSTDIR}"
LD_LIBRARY_PATH="\${WINK_INSTALL_DIR}/lib:\${LD_LIBRARY_PATH}"
export LD_LIBRARY_PATH
exec "\${WINK_INSTALL_DIR}/wink" "\$@"
EOF

	dobin wink	
	make_desktop_entry wink Wink wink.png Graphics
	cd "${EXPAT_S}"
	emake install prefix="${D}${WINK_INSTDIR}"
}
