# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Tool to transform DVD authorable VOBs into a DVD complete with
menus & suitable for playback on a standalone DVD player"
HOMEPAGE="http://dvdwizard.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"

KEYWORDS="~x86 ~ppc ~sparc ~amd64"
IUSE=""
DEPEND="sys-devel/bc
	media-gfx/imagemagick
	media-video/dvdauthor
	media-video/ffmpeg
	media-video/mjpegtools
	media-video/transcode"

src_install() {
	dobin chaptercheck dvdcpics dvdtguess dvdwizard dvdwizardrc mk_vmgm mk_vtsm mk_vtsm_info mk_vtsm_lang mpgprobe txt2png
	dodoc README
}

