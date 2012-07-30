# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit python eutils

MY_PN="${PN/tribler/Tribler}"
MY_P="${MY_PN}_${PV}_src"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="Python based Bittorrent/Internet TV application"
HOMEPAGE="http://www.tribler.org/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/python-2.4
	>=dev-libs/openssl-0.9.8
	>=dev-python/wxpython-2.8
	>=dev-python/m2crypto-0.16
	>=media-video/vlc-0.9"
DEPEND="${RDEPEND}
	app-arch/unzip
	>=dev-lang/swig-1.3.25"

src_unpack() {
	unpack ${A}
	cd "${S}"

	# Because tribler.py has Windows CR/LF at the end of it's lines
	sed -i -e 's/.$//' ${PN}.py || die "sed failed"
}

src_install() {
		dodir /usr/share/${PN}
		newbin tribler.sh tribler || die "executable failed"
		insinto /usr/share/${PN}
		doins -r ABC BitTornado Tribler Utility Dialogs icons Lang test TorrentMaker || die 
		doins abcengine.py btdownloadheadless.py btshowmetainfo.py webtest.py \
			interconn.py launchmanycore.py webservice.py safeguiupdate.py \
			tribler.py *.ico *.xpm *.conf *.nsi *.command *.bmp cities.txt people.txt superpeer.txt || die
		doicon ${PN}.xpm
		make_desktop_entry "tribler" "Tribler P2P Bittorrent/Youtube client" \
			${PN}.xpm "Application;Network;P2P"
		insopts -m0700
		doins btcreatetorrent.py btlaunchmany.py bttrack.py || die
		dodoc LICENSE.txt protocol_v3.txt readme.txt
		cd "${S}/debian"
		doman *.1
}

pkg_postinst() {
	python_mod_optimize "${ROOT}"usr/share/${PN}
	ewarn
	ewarn "VLC has not Python bindings available yet"
	ewarn "the internal player controls will not work."
	ewarn
}

pkg_postrm() {
	python_mod_cleanup "${ROOT}"usr/share/${PN}
}
