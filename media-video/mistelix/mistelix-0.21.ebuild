# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

EAPI=8

inherit autotools mono

DESCRIPTION="Mono based DVD authoring application with Theora slideshow creation capabilities."
HOMEPAGE="http://mistelix.org/"
SRC_URI="http://mistelix.org/files/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	dev-lang/mono
	>=media-libs/gst-plugins-base-0.10.6
	>=dev-dotnet/gtk-sharp-2.0.0
	dev-dotnet/gnome-sharp
	dev-dotnet/mono-addins
"
DEPEND="${RDEPEND}
"

src_unpack() {
	unpack "${A}"
        cd "${S}"
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
	dodoc AUTHORS ChangeLog NEWS README MAINTAINERS
	mono_multilib_comply
}
