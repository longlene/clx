DESCRIPTION="On-screen display (OSD) with transparency"
HOMEPAGE="http://neugierig.org/software/ghosd/"
SRC_URI="${HOMEPAGE}/download/${P}.tar.bz2"

KEYWORDS="~x86 ~amd64"
LICENSE="GPL-2"
SLOT="0"

RDEPEND=">=x11-libs/cairo-1.4.10
         >=x11-libs/pango-1.16.5
	 >=dev-libs/glib-2.12.13"

DEPEND="${RDEPEND}
        dev-util/pkgconfig"

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
}
