# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

#inherit distutils eutils flag-o-matic toolchain-funcs versionator

DESCRIPTION="The DICOM Toolkit"
HOMEPAGE="http://dicom.offis.de/dcmtk.php.en"
SRC_URI="ftp://dicom.offis.de/pub/dicom/offis/software/dcmtk/dcmtk354/dcmtk-${PV}.tar.gz"

LICENSE="BSD"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE="png ssl tcpd tiff xml2 zlib"
RDEPEND="png? ( media-libs/libpng )
	ssl? ( dev-libs/openssl )
	tiff? ( media-libs/tiff ) 	
	xml2? ( dev-libs/libxml2 )
	zlib? ( sys-libs/zlib )"

DEPEND="${RDEPEND}"

src_compile() {

	# build config list
	local CONFIG_VARIABLES=""
	use png && CONFIG_VARIABLES="${CONFIG_VARIABLES} --with-libpng"
	use ssl && CONFIG_VARIABLES="${CONFIG_VARIABLES} --with-libopenssl"
	use tcpd && CONFIG_VARIABLES="${CONFIG_VARIABLES} --with-libwrap"
	use tiff && CONFIG_VARIABLES="${CONFIG_VARIABLES} --with-libtiff"
	use xml2 && CONFIG_VARIABLES="${CONFIG_VARIABLES} --with-libxml"
	use zlib && CONFIG_VARIABLES="${CONFIG_VARIABLES} --with-zlib"
	
	./configure ${CONFIG_VARIABLES}	|| die "configuration failed"

	ARCH="" emake -j1 || die "make failed"
}

src_install() {
	make DESTDIR=${D} install install-lib install-include install-bin install-doc || die "make install failed"

	# install in proper directories	
	dodir /usr/lib
	dodir /usr/include
	dodir /usr/share

	mv ${D}/usr/local/dicom/bin/ ${D}/usr/bin
	mv ${D}/usr/local/dicom/include/dcmtk/ ${D}/usr/include/dcmtk
	mv ${D}/usr/local/dicom/lib/lib* ${D}/usr/lib
	mv ${D}/usr/local/dicom/man/ ${D}/usr/share/man

	rm -r ${D}/usr/local/dicom/include
}

