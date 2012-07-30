# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit distutils eutils toolchain-funcs

# ftp://dicom.offis.de/pub/dicom/offis/software/dcmtk/dcmtk354/COPYRIGHT

DESCRIPTION="The DICOM Toolkit"
HOMEPAGE="http://dicom.offis.de/dcmtk.php.en"
DEB_PV=4 # Debian patch dcmtk_3.5.4-4.diff
DCMTK_DATE=20101130
SRC_URI="
http://dicom.offis.de/download/dcmtk/snapshot/${P}_${DCMTK_DATE}.tar.gz
mirror://debian/pool/main/${PN:0:1}/${PN}/${PN}_3.5.4-${DEB_PV}.diff.gz
"

LICENSE="BSD"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE="png ssl tcpd tiff xml2 zlib"
RDEPEND="media-libs/jpeg
	app-doc/doxygen
	sys-devel/autoconf
	png? ( media-libs/libpng )
	ssl? ( dev-libs/openssl )
	tcpd? ( sys-apps/tcp-wrappers )
	tiff? ( media-libs/tiff )
	xml2? ( dev-libs/libxml2 )
	zlib? ( sys-libs/zlib )"

DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
	cd ${WORKDIR}
	mv ${P}_${DCMTK_DATE} ${P}
	cd ${S}
#	patch -p1 < ../${PN}_3.5.4-${DEB_PV}.diff
##	# EPATCH_OPTS="-p1 -g0 -E --no-backup-if-mismatch" epatch ${PN}_3.5.4-${DEB_PV}.diff
#	for i in `ls ${S}/debian/patches`; do
#		patch -p1 < $i
#	done
	patch -p1 < ${S}/debian/patches/01_fix_perl_script_path.patch
#	EPATCH_SOURCE="${S}/debian/patches" EPATCH_SUFFIX="patch" \
#		EPATCH_FORCE="yes" epatch
}

src_compile() {
	config=""

	./configure \
		--prefix=/usr \
		--exec-prefix=/usr \
		--mandir=/usr/share/man	\
		--infodir=/usr/share/info \
		--includedir=/usr/include \
		--libdir=/usr/lib \
		--datadir=/usr/share \
		--sysconfdir=/etc/dcmtk \
		--with-private-tags \
		$(use_with tiff libtiff) \
		$(use_with zlib zlib) \
		$(use_with png libpng) \
		$(use_with xml2 libxml) \
		$(use_with tcpd libwrap) \
		$(use_with ssl openssl) \
		${config} || die "configure failed"

	ARCH="" emake -j1 || die "make failed"
	make html
}

src_test() {
	make check || die "make check failed"
}

src_install() {
	make DESTDIR=${D} install install-lib install-include install-bin install-doc install-html || die "make install failed"

	# install in proper directories
	cd ${D}usr/share/doc
	dodoc ${PN}/COPYRIGHT ${PN}/FAQ ${PN}/HISTORY ${PN}/*.txt
	dohtml ${PN}/html/*
	rm -rf ${PN}
}
