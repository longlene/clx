# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils mono

DESCRIPTION="Saves Last.fm streams to mp3's"
HOMEPAGE="http://thelastripper.com/"
SRC_URI="http://thelastripper.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="debug"

RDEPEND="dev-dotnet/glib-sharp
	dev-dotnet/gtk-sharp
	dev-dotnet/taglib-sharp"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	sed -ie "s-@expanded_libdir@/@PACKAGE@/TheLastRipper.png-TheLastRipper-" \
		MonoClient/thelastripper.desktop.in || die

	if use debug ; then
	sed -ie "s-TheLastRipper.exe-MonoClient.exe-" \
		MonoClient/thelastripper.in || die
	fi
}

src_configure() {
	local myconf

	if use debug ; then
		myconf="--enable-debug"
	else
		myconf="--enable-release"
	fi

	econf "$myconf"
}

src_install() {
	emake DESTDIR="${D}" install || die

	doicon MonoClient/TheLastRipper.png || die
}
