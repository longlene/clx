# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

DESCRIPTION="Generic A/V API that relies on various multimedia players for Linux systems"

HOMEPAGE="http://${PN}.geexbox.org/"

SRC_URI="${HOMEPAGE}/releases/${P}.tar.bz2"

LICENSE="LGPL-2.1"

SLOT="0"

KEYWORDS="~x86 ~amd64"

IUSE="X debug doc gstreamer mplayer python vlc xine"

RDEPEND="X? ( x11-libs/libX11 )
	gstreamer? ( media-libs/gstreamer:0.10 )
	mplayer? ( media-video/mplayer )
	python? ( dev-lang/python )
	vlc? ( media-video/vlc )
	xine? ( media-libs/xine-lib )"

# add build-time dependencies
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

#S="${WORKDIR}/${P}"

pkg_setup() {
	# at least one of the player backends has to be used
	if ! use gstreamer && ! use mplayer && ! use vlc && ! use xine; then
		eerror "Please set at least one of the following USE flags:"
		eerror "	gstreamer, mplayer, vlc, xine"
		eerror ""
		die ""
	fi
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
		$(use_enable python binding-python ) \
		$(use_enable vlc ) \
		$(use_enable xine ) \
		|| die "./configure failed"
}

src_install() {
	einstall DESTDIR="${D}" || die "einstall failed"
	dodoc AUTHORS ChangeLog README
}
