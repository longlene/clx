# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-video/dxr3player/dxr3player-0.10.ebuild,v 1.6 2006/05/14 16:56:19 arj Exp $

DESCRIPTION="A DVD player for Linux, supports the DXR3 (aka Hollywood+) board."
HOMEPAGE="http://dxr3player.sourceforge.net"

SRC_URI="http://mesh.dl.sourceforge.net/sourceforge/dxr3player/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="lirc sdl mmx sse 3dnow dxr3"

DEPEND=">=media-libs/libmad-0.15.1b
	lirc? ( app-misc/lirc )
	dxr3? ( media-video/em8300-libraries )
	sdl? ( media-libs/libsdl media-libs/libmpeg2 )"

src_compile() {

	myconf="--with-mad"

	if use lirc; then
		myconf="${myconf} --with-lirc=/usr"
	fi

	if use sdl; then
		myconf="${myconf} --with-sdl=/usr"
	fi

	if use dxr3; then
		myconf="${myconf} --with-em8300=/usr"
	fi

	if use 3dnow; then
		accel=" --with-mm-accel=3dnow"
	fi
	if use mmx; then
		accel=" --with-mm-accel=mmx"
	fi
	if use sse; then
		accel=" --with-mm-accel=sse"
	fi

	econf ${myconf} ${accel} || die
	emake || die
}

src_install() {
	dodoc AUTHORS ChangeLog LISEZMOI NEWS README

	mybin="src/dxr3player/dumpdvd"

	if [ -e /usr/include/linux/em8300.h ]
	then
		mybin="${mybin} src/dxr3player/dxr3player"
	fi

	if use sdl; then
		mybin="${mybin} src/dxr3player/dxr3player-sdl"
	fi

	dobin $mybin
}
