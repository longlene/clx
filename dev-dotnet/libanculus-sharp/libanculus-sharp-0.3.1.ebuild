# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils mono

DESCRIPTION="Reusable utility library for Mono and .NET"
HOMEPAGE="http://code.google.com/p/libanculus-sharp/"
SRC_URI="http://libanculus-sharp.googlecode.com/files/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gtk extended winforms"

DEPEND=">=dev-lang/mono-1.2.4
		dev-dotnet/dbus-glib-sharp
		dev-dotnet/gtk-sharp"
RDEPEND="${DEPEND}"

src_compile() {

		local myconf

	    if ! use gtk; then
	        myconf="${myconf} --disable-gtk"
	    fi

		cd ${WORKDIR}/${P} && /bin/sh ${WORKDIR}/${P}/autogen.sh ${myconf} --prefix=/usr

		emake || die "emake failed"
}

src_install() {

		emake DESTDIR="${D}" install || die "Install failed"

}
