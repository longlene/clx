# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils mercurial

DESCRIPTION="Generic A/V API that relies on various multimedia players for Linux systems"

HOMEPAGE="http://${PN}.geexbox.org/"

#SRC_URI="${HOMEPAGE}/releases/${P}.tar.bz2"
: ${EHG_REPO_URI:=http://hg.geexbox.org/${PN}}

LICENSE="LGPL-2.1"

SLOT="0"

KEYWORDS=""

IUSE="X debug doc gstreamer mplayer vlc +xine +xlib-hack"

RDEPEND="X? ( x11-libs/libX11 )
	gstreamer? ( media-libs/gstreamer:0.10 )
	mplayer? ( media-video/mplayer )
	vlc? ( media-video/vlc )
	xine? ( media-libs/xine-lib )
	X? ( mplayer? ( x11-libs/libxcb ) )"

# add build-time dependencies
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

S="${WORKDIR}/${PN}"

pkg_setup() {
	# at least one of the player backends has to be used
	if ! use gstreamer && ! use mplayer && ! use vlc && ! use xine; then
		eerror "Please set at least one of the following USE flags:"
		eerror "	gstreamer, mplayer, vlc, xine"
		eerror ""
		die ""
	fi

	# the Xlib hack can only be used with X
	if use xlib-hack && ! use X; then
		eerror "The USE flag 'xlib-hack' also requires the USE flag 'X' to be set !"
		eerror ""
		die ""
	fi
}

src_unpack() {
	mercurial_src_unpack
	cd "${S}"
}

src_configure() {
	local conflibdir
	if [ "${ARCH}" = "amd64" ]; then
		conflibdir="--libdir=/usr/lib64"
	fi
	./configure \
		--prefix=/usr \
		${conflibdir} \
		--disable-strip \
		$(use_enable X x11 ) \
		$(use_enable debug ) \
		$(use_enable doc ) \
		$(use_enable gstreamer ) \
		$(use_enable mplayer ) \
		--disable-binding-python \
		$(use_enable vlc ) \
		$(use_enable xine ) \
		$(use_enable xlib-hack ) \
		|| die "./configure failed"
}

src_install() {
	einstall DESTDIR="${D}" || die "einstall failed"
	dodoc AUTHORS ChangeLog README TODO
}
