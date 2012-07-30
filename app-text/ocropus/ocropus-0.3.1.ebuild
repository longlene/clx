# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

if [[ ${PV} == "9999" ]] ; then
	ESVN_REPO_URI="http://ocropus.googlecode.com/svn/trunk"
	inherit subversion
else
	SRC_URI="http://ocropus.googlecode.com/files/${P}.tar.gz"
fi

DESCRIPTION="state-of-the-art document analysis and OCR system based on tesseract"
HOMEPAGE="http://code.google.com/p/ocropus/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="sdl lua openfst spell interactive"

RDEPEND=">=app-text/tesseract-2
	media-libs/tiff
	media-libs/libpng
	media-libs/jpeg
	media-libs/iulib
	spell? ( app-text/aspell )
	openfst? ( media-libs/OpenFst )
	lua? ( media-libs/leptonlib )
	interactive? ( dev-libs/libedit )"
DEPEND="${RDEPEND}
	dev-util/ftjam"

S=${WORKDIR}/${P%.1}

src_compile() {
	#	$(use_with ocroscript)
	econf \
		--with-tesseract=/usr \
		--with-iulib=/usr \
		$(use_with openfst fst) \
		$(use_with spell aspell) \
		$(use_with sdl SDL) \
		$(use_with lua leptonica) \
		|| die "econf failed"
	emake || die
#	jam || die "emake failed"
}

src_test() {
	cd "${S}/testing"
	./test-compile || die "Tests failed to compile"
	./test-run || die "At least one test failed"
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc CHANGES README
}
