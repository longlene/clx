# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2:2.5"

LANGS=" ca ca@valencia cs da de el en_GB es fr gl hu it nb pl pt pt_BR sl sv uk zh_CN zh_HK zh_TW"

inherit gnome2 autotools python

DESCRIPTION="OCRFeeder is a document layout analysis and optical character recognition system. "
HOMEPAGE="http://live.gnome.org/OCRFeeder"
SRC_URI="http://ftp.gnome.org/pub/GNOME/sources/ocrfeeder/0.7/ocrfeeder-0.7.7.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuneiform gocr ocrad +tesseract"
IUSE+="${LANGS// / linguas_}"

RDEPEND="
	>=dev-python/pygtk-2.13
	>=dev-python/imaging-1.1[scanner]
	>=dev-python/pygoocanvas-0.12
	>=dev-python/odfpy-0.7
	dev-python/reportlab
	dev-python/pyenchant
	dev-python/gtkspell-python
	cuneiform? ( app-text/cuneiform )
	gocr? ( app-text/gocr )
	ocrad? ( app-text/ocrad )
	tesseract? ( app-text/tesseract )"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35.0"

src_prepare() {
	# remove bundled odfpy
	epatch ${FILESDIR}/${PN}-0.7.6-pyodf-unbundle.patch
	rm -rf src/ocrfeeder/odf/ || die
	
	# PIL hash collision 3
	epatch ${FILESDIR}/${PN}-0.7.6-fix-PIL-hashcollision.patch

	# linguas
	local langs x
	for x in ${LANGS}; do
		if use !linguas_${x}; then
			sed -e "/^${x}$/d" -i po/LINGUAS || die
			rm -rf po/${x}.po locale/${x} || die
		fi
	done
    eautoreconf

	gnome2_src_prepare
	
}
