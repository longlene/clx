# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
inherit versionator eutils

DESCRIPTION="a GTK fronted to ffmpeg (with iPod presets)"
HOMEPAGE="http://vive.sourceforge.net/"
MY_PV=$(replace_version_separator _ - ${PV})
MY_P="${PN}-${MY_PV}"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"
S=${WORKDIR}/${MY_P}

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="dvd"

DEPEND="media-video/ffmpeg
	x11-libs/vte
	media-video/mplayer
	>=x11-libs/gtk+-2
	media-video/vobcopy
	dvd? ( media-libs/libdvdnav )
	dvd? ( media-libs/libdvdread )
	dvd? ( media-libs/libdvdcss )"
RDEPEND=""

src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
}

src_compile() {
	econf $(use_enable dvd) || die
	emake || die
}

src_install() {
	einstall || die "einstall failed"
	ewarn you need to copy over the prefrences file found in /usr/share/doc/"${PN}"/examples
	ewarn to your home directory/.vive/ in order to get the presets
}
