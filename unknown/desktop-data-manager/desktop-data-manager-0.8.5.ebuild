# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils mono gnome2

DESCRIPTION="desktop-data-manager includes a clipboard history and an \
application to take screenshots"
HOMEPAGE="http://data-manager.sf.net/"
SRC_URI="mirror://sourceforge/data-manager/${PN}_${PV}_src.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND=">=dev-dotnet/gtk-sharp-2.8
		>=dev-dotnet/gconf-sharp-2.8
		>=dev-dotnet/glade-sharp-2.8
		>=dev-dotnet/gnome-sharp-2.8"
RDEPEND="${DEPEND}"
S="${WORKDIR}/DesktopDataManager"

pkg_setup() {
	if ! built_with_use dev-lang/mono X; then
		eerror "You need X bindings for mono"
		eerror "Please emerge mono with flag use X enabled"
		die "Mono needs flag use X enabled"
	fi
}
