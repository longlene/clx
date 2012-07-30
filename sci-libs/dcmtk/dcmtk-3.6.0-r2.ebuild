# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit cmake-utils eutils

DESCRIPTION="The DICOM Toolkit"
HOMEPAGE="http://dicom.offis.de/dcmtk.php.en"
DEB_PV=7 # Debian patch dcmtk_3.6.0-7.tar.gz
SRC_URI="
ftp://dicom.offis.de/pub/dicom/offis/software/dcmtk/dcmtk360/${P}.tar.gz
mirror://debian/pool/main/${PN:0:1}/${PN}/${PN}_${PV}-${DEB_PV}.debian.tar.gz
"

KEYWORDS="~amd64 x86"
SLOT="0"
IUSE="doc png ssl tcpd tiff +threads xml zlib"

RDEPEND="
	virtual/jpeg
	png? ( media-libs/libpng )
	ssl? ( dev-libs/openssl )
	tcpd? ( sys-apps/tcp-wrappers )
	tiff? ( media-libs/tiff )
	xml? ( dev-libs/libxml2:2 )
	zlib? ( sys-libs/zlib )"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )
	media-gfx/graphviz"

src_unpack() {
	unpack ${A}
	cd "${S}"

#	EPATCH_FORCE=1 EPATCH_SUFFIX=patch epatch "${WORKDIR}"/debian/patches/

#	local p
#	for p in $(cat "${WORKDIR}"/debian/patches/series); do
#		epatch "${WORKDIR}"/debian/patches/${p}
#	done

	local dpatch="${WORKDIR}/debian/patches"
	epatch \
		"${dpatch}"/01_fix_perl_script_path.patch \
		"${dpatch}"/02_dcmtk_3.6.0-1.patch \
		"${dpatch}"/04_nostrip.patch \
		"${dpatch}"/dcmtk_version_number.patch \
		"${dpatch}"/png_tiff.patch \
		"${dpatch}"/regression_stacksequenceisodd.patch

	epatch "${FILESDIR}"/${PN}-asneeded.patch
	sed -e "s:share/doc/dcmtk:&-${PV}:" \
		-e "s:DIR \"/:DIR \"/usr/:" \
		-e "s:usr/etc:etc:" \
		-e "s:/lib\":/$(get_libdir)\":" \
		-e "s:COPYRIGHT::" \
		-i CMakeLists.txt || die
	sed -e 's:${CMAKE_INSTALL_PREFIX}/::' \
		-i dcmwlm/data/CMakeLists.txt doxygen/CMakeLists.txt || die
	# Temporary workaround: docs are not build with CMake
	sed -i -e '/include/d' doxygen/Makefile.in || die
}

src_configure() {
	mycmakeargs="${mycmakeargs}
		-DBUILD_SHARED_LIBS=ON
		-DCMAKE_INSTALL_PREFIX=/
		$(cmake-utils_use tiff DCMTK_WITH_TIFF)
		$(cmake-utils_use png DCMTK_WITH_PNG)
		$(cmake-utils_use xml DCMTK_WITH_XML)
		$(cmake-utils_use zlib DCMTK_WITH_ZLIB)
		$(cmake-utils_use ssl DCMTK_WITH_OPENSSL)
		$(cmake-utils_use doc DCMTK_WITH_DOXYGEN)
		$(cmake-utils_use threads DCMTK_WITH_THREADS)"
	cmake-utils_src_configure
	if use doc; then
		cd "${S}"/doxygen
		econf
	fi
}

src_compile() {
	cmake-utils_src_compile
	if use doc; then
		emake -C "${S}"/doxygen || die
	fi
}

src_install() {
	cmake-utils_src_install
	if use doc; then
		cd "${S}"
		doman doxygen/manpages/man1/* || die
		dohtml -r doxygen/htmldocs/* || die
	fi
}
