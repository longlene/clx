# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_DEPEND="2"

DESCRIPTION="Software to make a video slideshow from pictures"
HOMEPAGE="http://www.videoporama.tuxfamily.org"
SRC_URI="http://download.tuxfamily.org/videoporama/src/Videoporama_0.8.2-1.tar.gz"
S="${WORKDIR}/Videoporama_0.8.2"

MY_SHAREDIR="/usr/share/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="faac exif mp3 theora vorbis vpx x264 xvid"

RDEPEND=">=dev-python/PyQt4-4.5[webkit]
	>=dev-python/imaging-1.1.6
	>=media-video/ffmpeg-0.5[encode,faac?,mp3,theora?,vorbis?,vpx?,x264?,xvid?]
	media-video/mplayer
	media-sound/sox
	exif? ( dev-python/pyexiv2 )"

src_install() {
	dobin ${PN}
	dodir ${MY_SHAREDIR}
	insinto ${MY_SHAREDIR}
	doins *
	dodir ${MY_SHAREDIR}/locale
	insinto ${MY_SHAREDIR}/locale
	doins locale/*
	dodir ${MY_SHAREDIR}/help
	insinto ${MY_SHAREDIR}/help
	doins help/*
	dodir ${MY_SHAREDIR}/help/images
	insinto ${MY_SHAREDIR}/help/images
	doins help/images/*
	dodir ${MY_SHAREDIR}/icons
	insinto ${MY_SHAREDIR}/icons
	doins icons/*
	dodir ${MY_SHAREDIR}/iconstr
	insinto ${MY_SHAREDIR}/iconstr
	doins iconstr/*
	dodir ${MY_SHAREDIR}/luma
	insinto ${MY_SHAREDIR}/luma
	doins luma/*

	# install the desktop entry
	domenu ${FILESDIR}/${PN}.desktop
}
