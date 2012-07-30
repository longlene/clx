
DESCRIPTION="Simple X onscreen analog clock"
HOMEPAGE="http://xonclock.sourceforge.net/"
SRC_URI="mirror://sourceforge/xonclock/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND=">=x11-base/xorg-x11-6.8.2
	>=media-libs/freetype-2.1.9
	>=media-libs/libpng-1.2.13
	>=media-libs/jpeg-6b
	>=media-libs/tiff-3.8.2
	>=x11-libs/libXpm-3.5.5"

src_compile() {
	econf
	emake || die
}

src_install() {
	into /usr
	einstall || die
	newman xonclock.man xonclock.1
}
