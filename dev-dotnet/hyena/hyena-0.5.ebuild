# Copyright 1999-2009 Tiziano Müller
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit mono versionator

DESCRIPTION="Library used to make awesome applications."
HOMEPAGE="http://live.gnome.org/Hyena"
SRC_URI="mirror://gnome/sources/${PN}/$(get_version_component_range 1-2)/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug"

RDEPEND=">=dev-lang/mono-2.4.2
	dev-dotnet/glib-sharp
	dev-dotnet/gtk-sharp"
DEPEND="${RDEPEND}
	sys-apps/sed
	dev-util/pkgconfig"

src_configure() {
	sed -i 's/dnl/#/' */Makefile.in # to make it work with make 3.82
	econf $(use_enable debug) $(use_enable !debug release)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc NEWS README
}

