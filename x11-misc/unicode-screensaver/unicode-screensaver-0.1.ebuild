DESCRIPTION="simple screensaver application that repeatedly randomly picks an unicode character"
HOMEPAGE="http://www.joachim-breitner.de/projects#unicode-screensaver"
SRC_URI="http://www.joachim-breitner.de/archive/${PN}/${P}.tar.gz"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="as-is"
IUSE=""

RDEPEND="media-libs/fontconfig
	x11-libs/libX11
	x11-libs/libXmu
	x11-libs/libXt
	x11-libs/libXft"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_install() {
	emake DESTDIR="${D}" install || die
}
