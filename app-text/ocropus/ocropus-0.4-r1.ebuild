# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils autotools flag-o-matic

if [[ ${PV##*.} == "9999" ]] ; then
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
	sci-libs/gsl
	>=media-libs/iulib-0.4
	spell? ( app-text/aspell )
	openfst? ( sci-misc/openfst )
	lua? ( media-libs/leptonica )
	interactive? ( dev-libs/libedit )"
# depedencies in ubuntu: build-essential imagemagick \ tesseract-ocr tesseract-ocr-dev \ libpng12-dev libjpeg62-dev libtiff4-dev libgif-dev \ libsdl-gfx1.2-dev libsdl-image1.2-dev libsdl1.2-dev \ libavcodec-dev libavdevice-dev libavformat-dev libavutil-dev \ libavfilter-dev \ tesseract-ocr-dev libleptonica-dev \ libgsl0-dev libblas-dev \ python-dev swig1.3

# gcc-3.4 : WARN_DEPRECATED, et aussi sqrt(float) mal géré :-(     template #
# <class T> T rowdist_euclidean(narray<T> &values,int i,narray<T> &v) { return
# (T)sqrt(rowdist_euclidean_squared(values,i,v)); } template <> float
# rowdist_euclidean(narray<float> &values,int i,narray<float> &v) { return
# (float)sqrt((double)(rowdist_euclidean_squared(values,i,v))); } dans
# /usr/include/colib/rowarrays.h

DEPEND="${RDEPEND}
    >=sys-devel/gcc-3.4
	dev-util/ftjam"

S=${WORKDIR}/${P%.1}/ocropus

pkg_setup() {
    append-ldflags $(no-as-needed)
}


src_unpack() {
	unpack ${A}
	#cd "${S}/.."
	#mv "${S}" "iulib"
	#mv "iulib/ocropus" "${S}"
	cd "${S}"
	epatch "${FILESDIR}"/ocropus-0.4-glibc-2.10.patch
	epatch "${FILESDIR}"/genAM.py.patch
	python ./genAM.py > Makefile.am
	eautoreconf
}

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
	cd "${S}"
	emake DESTDIR="${D}" install || die
	dodoc CHANGES README
	gunzip ${D}/usr/share/ocropus/models/default.fst.gz
	dodir /usr/local/share
	dosym ../../share/ocropus /usr/local/share/ocropus # ln -s
}
