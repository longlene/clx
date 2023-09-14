# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Wrapper script to draw traceroutes of current network connections on xplanet images"
HOMEPAGE="http://geoxplanet.sourceforge.net"
SRC_URI="mirror://sourceforge/geoxplanet/${PF}.zip
mirror://sourceforge/geoxplanet/geoip.db.zip"

LICENSE="GPL-1 MAXMIND"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="xinerama"

RDEPEND="x11-misc/xplanet
	dev-python/pygtk
	xinerama? ( media-gfx/imagemagick )
	|| (
		( >=dev-python/pysqlite-2.0.3 <dev-lang/python-2.5 )
		>=dev-lang/python-2.5
	)"
DEPEND="${RDEPEND} app-arch/unzip"

src_unpack() {
	if has_version ">=dev-lang/python-2.5" && ! built_with_use dev-lang/python sqlite ; then
		ewarn 	"Python 2.5 or higher (>=dev-lang/python-2.5) must be compiled with the sqlite support."
		einfo 	"Please emerge python with sqlite USE flag and then emerge GeoXPlanet."
		die 	"Python doesn't have sqlite support"
	fi

	unpack ${A}
	cd "${S}"

	# Originally GeoXPlanet moves temp files (images, config files, etc...) into user's home at first launch
	# This patch changes move operation to copy
	epatch "${FILESDIR}/${PF}.patch"
}

src_install() {
	dobin "${FILESDIR}/geoxplanet"

	cd "${WORKDIR}"
	insinto /usr/share/geoxplanet/
	mv README README.geoip
	dodoc README.geoip
	doins geoip.db || die
	cd "${S}"
	doins -r arcFiles defaults src temp templates || die
	insinto /usr/share/geoxplanet/src
	insopts -m755
	doins src/GeoXPlanet.py src/configGUI.py || die
	dodoc CHANGELOG CONFIG_OPTIONS README

	ewarn "GeoXPlanet will show configuration dialog only at first launch, but you can type 'geoxplanet -C' to use it later."
}
