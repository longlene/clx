# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

REV="2414"
DIR="${PN}_r${REV}-v${PV}"
GLFTPD_DIR="/opt/glftpd"

DESCRIPTION="Zipscript for file uploads."
HOMEPAGE="http://www.pzs-ng.com"
SRC_URI="http://www.pzs-ng.com/stable/${DIR}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="nomirror"

RDEPEND="=net-ftp/glftpd-2.01"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${DIR}"


pkg_setup() {
	ewarn "You can modify ${FILESDIR}/zsconfig.h for your need."
	ewarn "Then don't forgot to execute \"ebuild ${PN}.ebuild digest\""
}

src_compile() {
        econf \
		--with-glpath=${GLFTPD_DIR} \
		--enable-gl201 \
		|| die "econf failed"
					
        cp ${FILESDIR}/zsconfig.h ${S}/zipscript/conf/

	emake || die "emake failed"
}

src_install() {
	cd ${S}

	sed 's/prefix=/prefix=\${D}/' ./Makefile > ./Makefile.xxx
	sed 's/prefix=/prefix=\${D}/' ./sitewho/Makefile > ./sitewho/Makefile.xxx
	sed 's/prefix=/prefix=\${D}/' ./sitebot/src/Makefile > ./sitebot/src/Makefile.xxx
	sed 's/prefix=/prefix=\${D}/' ./zipscript/utils/Makefile > ./zipscript/utils/Makefile.xxx
	sed 's/prefix=/prefix=\${D}/' ./zipscript/src/Makefile > ./zipscript/src/Makefile.xxx
	sed 's/prefix=/prefix=\${D}/' ./lib/Makefile > ./lib/Makefile.xxx
	mv ./Makefile.xxx ./Makefile
	mv ./sitewho/Makefile.xxx ./sitewho/Makefile
	mv ./sitebot/src/Makefile.xxx ./sitebot/src/Makefile
	mv ./zipscript/utils/Makefile.xxx ./zipscript/utils/Makefile
	mv ./zipscript/src/Makefile.xxx ./zipscript/src/Makefile
	mv ./lib/Makefile.xxx ./lib/Makefile

	dodoc ./README.ZSCONFIG

	make install || die "make install failed"

	cp -f ./scripts/nfoextract/nfoextract.sh ${D}${GLFTPD_DIR}/bin

	chmod 755 ${D}${GLFTPD_DIR}/bin/*
}
