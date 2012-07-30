#WANT_AUTOCONF='2.5'
#AT_M4DIR='m4'
#inherit autotools
inherit flag-o-matic

MyPN="${PN}"
MyPV="${PV/_/}"
MyP="${MyPN}-${MyPV}"
DESCRIPTION="a cross-platform library for capturing video from webcams and other video capture devices"
HOMEPAGE="http://${MyPN}.sourceforge.net/"
LICENSE="GPL-2 LGPL-2"

SRC_URI="mirror://sourceforge/${MyPN}/${MyP}.tar.gz"
SLOT="0"
KEYWORDS="~arm ~x86"

RESTRICT="mirror"

S="${WORKDIR}/${MyP}"

src_unpack() {
	unpack ${A}
	cd "${S}"
#	eautoreconf
}

src_compile() {
#	append-flags -I/usr/include/iax
#	econf \
#		--disable-video \
#	econf --with-gnu-ld
	econf
	emake || die 'emake failed'
}

src_install() {
	emake DESTDIR="${D}" install || die 'emake install failed'
}
