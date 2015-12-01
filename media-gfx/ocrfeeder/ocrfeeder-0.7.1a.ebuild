# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND="2:2.5"

LANGS=" cs da de en_GB es fr gl it nb pt sl sv zh_CN zh_HK zh_TW"

inherit distutils gnome.org gnome2-utils

DESCRIPTION="OCRFeeder is a document layout analysis and optical character recognition system. "
HOMEPAGE="http://live.gnome.org/OCRFeeder"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuneiform gocr +ocrad tesseract"
IUSE+="${LANGS// / linguas_}"

RDEPEND="
	dev-python/libgnome-python
	>=dev-python/pygtk-2.13
	>=dev-python/imaging-1.1
	>=dev-python/pygoocanvas-0.12
	>=app-text/ghostscript-gpl-8.63
	>=app-text/unpaper-0.3
	>=dev-python/odfpy-0.7
	cuneiform? ( app-text/cuneiform )
	gocr? ( app-text/gocr )
	ocrad? ( app-text/ocrad )
	tesseract? ( app-text/tesseract )
"
DEPEND="${RDEPEND}
	dev-python/setuptools
	dev-util/intltool
"

src_prepare() {
	# remove bundled odfpy
	sed -e "s/ 'ocrfeeder.odf',//" \
		-i setup.py || die
	sed -e 's/from ocrfeeder.odf/from odf/' \
		-i src/ocrfeeder/feeder/documentGeneration.py || die
	rm -rf src/ocrfeeder/odf/ || die

	# linguas
	local langs x
	for x in ${LANGS}; do
		if use !linguas_${x}; then
			sed -e "/^${x}$/d" -i po/LINGUAS || die
			rm -rf po/${x}.po locale/${x} || die
		fi
	done

	distutils_src_prepare
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	distutils_pkg_postinst
	gnome2_icon_cache_update
}

pkg_postrm() {
	distutils_pkg_postrm
	gnome2_icon_cache_update
}
