# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.5"
inherit gnome2-utils distutils

MY_P="${P}"
DESCRIPTION="Optical Character Recognition and Document Analysis and Recognition for GNOME."
HOMEPAGE="http://live.gnome.org/OCRFeeder"
SRC_URI="http://ftp.gnome.org/pub/GNOME/sources/ocrfeeder/${PV}/${P}.tar.gz"

LICENSE="GPL-v3"
SLOT="0"
KEYWORDS="~x86 ~ppc ~sparc ~alpha ~arm ~amd64 ~ia64 ~hppa"
IUSE="+ocrad gocr tesseract"

RDEPEND=">=dev-python/pygtk-2.13
	>=dev-python/imaging-1.1
	>=dev-python/pygoocanvas-0.12
	>=app-text/ghostscript-gpl-8.63
	>=app-text/unpaper-0.3
	ocrad? ( app-text/ocrad )
	gocr? ( app-text/gocr )
	tesseract? ( app-text/tesseract )"

DEPEND=""
src_unpack() {
	echo
	einfo "The configuration XML file for the engine Ocrad is already"
	einfo "included with the project. In case the you doesn't want to use Ocrad,"
	einfo "the configuration file that is placed in the OCRFeeder's configuration folder"
	einfo "(~/.ocrfeeder) should perhaps be deleted."
	echo

	if ! use ocrad && ! use gocr && ! use tesseract ; then
		die "You must put ocrad, gocr or tesseract in your USE"
	fi

	unpack ${A}
}

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_src_install
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	distutils_pkg_postinst
	gnome2_icon_cache_update

	echo
	elog "The configuration XML file for the engine Ocrad is already"
	elog "included with the project. In case the you doesn't want to use Ocrad,"
	elog "the configuration file that is placed in the OCRFeeder's configuration folder"
	elog "(~/.ocrfeeder) should perhaps be deleted."
	echo
}

