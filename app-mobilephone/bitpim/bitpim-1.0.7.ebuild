# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-mobilephone/bitpim/bitpim-1.0.6-r1.ebuild,v 1.4 2010/06/08 16:23:41 arfrever Exp $

EAPI="2"

inherit eutils distutils fdo-mime multilib subversion

DESCRIPTION="Program to view and manipulate data on many LG and Sanyo Sprint mobile phones"
HOMEPAGE="http://www.bitpim.org/"
SRC_URI=""
ESVN_REPO_URI="https://bitpim.svn.sourceforge.net/svnroot/bitpim/releases/1.0.7/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# this needs fixing
#KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE="crypt evo usb"

COMMON_DEPEND="=dev-python/wxpython-2.8*
	dev-python/python-dsv
	dev-python/pyserial
	dev-python/apsw
	crypt? ( >=dev-python/paramiko-1.7.1
		dev-python/pycrypto )
	usb? ( dev-libs/libusb:0 )"
DEPEND="${COMMON_DEPEND}
	usb? ( dev-lang/swig )"
RDEPEND="${COMMON_DEPEND}
	media-video/ffmpeg
	media-libs/netpbm
	>=dev-lang/python-2.5"


src_unpack() {
	subversion_src_unpack
}

src_prepare() {
	epatch "${FILESDIR}/${P}-gentoo.patch"
	epatch "${FILESDIR}/${P}-ffmpeg_quality.patch"
	epatch "${FILESDIR}/${P}-gcc43.patch"
	sed -i "s/^PYTHONVER=.*/PYTHONVER=$(PYTHON)/" src/native/usb/build.sh
}

src_compile() {
	# USB stuff
	if use usb; then
	    cd "${S}/src/native/usb"
	    sh ./build.sh || die "compilation of native/usb failed"
	fi

	# strings
	cd "${S}/src/native/strings"
	distutils_src_compile

	# bmp2avi
	cd "${S}/src/native/av/bmp2avi"
	PLATFORM=linux make || die "compilation of native/bmp2avi failed"
}

src_install() {

	# Install files into right place
	#
	# BitPim is a self-contained app, so jamming it into
	# Python's site-packages might not be worthwhile.  We'll
	# Put it in its own home, and add the PYTHONPATH in the
	# wrapper executables below.
	local RLOC=/usr/$(get_libdir)/${P}

	# Main Python source
	insinto ${RLOC}
	doins src/*.py

	# Phone specifics
	insinto ${RLOC}/phones
	doins src/phones/*.py

	# Native products
	insinto ${RLOC}/native
	doins src/native/*.py
	insinto ${RLOC}/native/qtopiadesktop
	doins src/native/qtopiadesktop/*.py
	insinto ${RLOC}/native/outlook
	doins src/native/outlook/*.py
	insinto ${RLOC}/native/egroupware
	doins src/native/egroupware/*.py
	if use evo ; then
		insinto ${RLOC}/native/evolution
		doins src/native/evolution/*.py
	fi

	# strings
	cd "${S}/src/native/strings"
	distutils_src_install

	cd "${S}"
	insinto $RLOC/native/strings
	doins src/native/strings/__init__.py src/native/strings/jarowpy.py

	# usb
	if use usb; then
		insinto ${RLOC}/native/usb
		doins src/native/usb/*.py
		doins src/native/usb/*.so
	fi

	# Helpers and resources
	dobin src/native/av/bmp2avi/bmp2avi
	insinto ${RLOC}/resources
	doins resources/*

	# Bitfling
	if use crypt; then
		FLINGDIR="${RLOC}/bitfling"
		insinto $FLINGDIR
		cd "${S}/src/bitfling"
		doins *.py
		cd "${S}"
	fi

	# Creating scripts
	echo '#!/bin/sh' > "${T}/bitpim"
	echo "exec $(PYTHON) ${RLOC}/bp.py \"\$@\"" >> "${T}/bitpim"
	dobin "${T}/bitpim"
	if use crypt; then
		echo '#!/bin/sh' > "${T}/bitfling"
		echo "exec $(PYTHON) ${RLOC}/bp.py \"\$@\" bitfling" >> "${T}/bitfling"
		dobin "${T}/bitfling"
	fi

	# Desktop file
	insinto /usr/share/applications
	sed -i -e "s|%%INSTALLBINDIR%%|/usr/bin|" -e "s|%%INSTALLLIBDIR%%|${RLOC}|" \
		packaging/bitpim.desktop
	doins packaging/bitpim.desktop
}

pkg_postinst() {
	# Optimize in installed directory
	python_mod_optimize /usr/$(get_libdir)/${P}
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	python_mod_cleanup /usr/$(get_libdir)/${P}
	fdo-mime_desktop_database_update
}
