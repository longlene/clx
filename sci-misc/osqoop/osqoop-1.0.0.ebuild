# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Open source software oscilloscope"
HOMEPAGE="http://lsn.unige.ch/osqoop"

SRC_URI="http://lsn.unige.ch/osqoop/deb/source/${P/-/_}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86"

#------------------------------------------------------------------------------
#   From home page:
#
# To compile Osqoop, you need:
#    * Qt 4.0 (minimum) or Qt 4.1 (for all features), including qmake, gcc 
# In addition, to compile and use the TseAdExt data source, you need:
#   * On Unix: libusb To run it, you need:
#   * On Unix: fxload
# In addition, to compile the virtual mouse, you need:
#   * On Unix: libxtest
# The distribution of Osqoop comes with all plugins enabled and thus requires
# all aforementioned libraries. If you want to skip compilation of some plugins
# or do not have the required libraries, you can select the ones you want to
# compile by editing the SUBDIRS variable in datasource/DataSource.pro
# (for data source) and processing/Plugins.pro (for plugins).
# -----------------------------------------------------------------------------
IUSE="doc tseadext virtualmouse"

DEPEND=""
RDEPEND="${DEPEND} \
	>=x11-libs/qt-4.1 \
	virtualmouse?	( >=x11-libs/libXtst-1.0.2 ) \
	tseadext?	( >=sys-apps/fxload-20020411 >=dev-libs/libusb-0.1.11 )\
"


src_unpack() {
	
	unpack "${A}"
	cd "${S}"

	# The original configure script doesn't take care of 
	# your compiler flags. Although most of the source files
	# use only CXXFLAGS, you should set _both_ CFLAGS and
	# CXXFLAGS to change flags for all files.
	sed -ie 's/${QMAKE}/${QMAKE} QMAKE_CFLAGS_RELEASE="${CFLAGS}" QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"/' configure
	
	use virtualmouse || sed -ie 's/VirtualMouse//' processing/Plugins.pro 
	use tseadext	 || sed -ie 's/TseAdExt//' datasource/DataSource.pro
	
}

src_compile() {

	./configure || die "./configure script failed"
	emake || die "emake failed"
}


src_install() {
	
	# make install does not do anything, so we must do everything by hand
	# The program has all it needs in one directory: target.
	# I suggest copying it into /usr/share/${PF} and making links to binaries
	cd "${S}/target"
	my_insdir="/usr/share/${PF}"
	
	exeinto "${my_insdir}"
	doexe osqoop setupfx2
	dosym "${my_insdir}/osqoop"	/usr/bin/osqoop
	dosym "${my_insdir}/setupfx2" /usr/bin/setupfx2

	insinto "${my_insdir}"
	doins tseadextfw.hex

	insinto "${my_insdir}/datasource"
	doins datasource/*
	
	insinto "${my_insdir}/processing"
	doins processing/*

	
	cd "${S}"
	dodoc authors changelog readme
	if use doc ; then 
		dohtml doc/manual/user-manual-en.html doc/manual/osqoop.css
		insinto "/usr/share/doc/${PF}/html/images"
		doins doc/manual/images/*
	fi	

}
