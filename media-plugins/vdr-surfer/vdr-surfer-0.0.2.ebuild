IUSE=""

inherit vdr-plugin eutils

RESTRICT="nomirror"

DESCRIPTION="OSD news browser based on Lynx"
HOMEPAGE="http://www.vdr-wiki.de/wiki/index.php/Surfer-plugin"
SRC_URI="http://home.foni.net/~frankhl/${P}.tgz"
KEYWORDS="~x86 ~amd64"
SLOT="0"
LICENSE="GPL-2"

DEPEND=">=media-video/vdr-1.2.0
	www-client/lynx"

src_install() {
	vdr-plugin_src_install

	cd ${S}
	insinto /etc/vdr/plugins/surfer
	doins surfer.conf

	exeinto /etc/vdr/plugins/surfer
	exeopts -m0755
	doexe getPage.sh
}
