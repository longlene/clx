# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Radio browser ( shoutcast / icecast ) plugin for Rhythmbox"
HOMEPAGE="http://www.programmierecke.net/programmed/${PN}.html"
SRC_URI="http://www.programmierecke.net/programmed/${P}.tar.gz"

EAPI="2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="media-sound/rhythmbox"
DEPEND="sys-devel/make"

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc CHANGELOG || die
}

#pkg_postinst() {
#	elog "To use Nautilus Terminal you will need to restart "
#	elog "nautilus. To do so run 'nautilus -q && nautilus &'"
#	elog "in a terminal"
#}


