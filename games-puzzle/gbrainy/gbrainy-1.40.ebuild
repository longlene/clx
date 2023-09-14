# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit games

DESCRIPTION="gbrainy is a brain teaser game and trainer to have fun and to keep your brain trained."
HOMEPAGE="http://live.gnome.org/gbrainy"
SRC_URI="http://gent.softcatala.org/jmas/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc"
IUSE=""

DEPEND=">=dev-util/intltool-0.35
	>=dev-lang/mono-1.1.7
	>=dev-dotnet/gtk-sharp-2.10
	>=dev-dotnet/gnome-sharp-2.10
	>=x11-libs/gtk+-2.8
	>=gnome-base/librsvg-2.2
	>=x11-libs/cairo-1.2
	>=dev-dotnet/mono-addins-0.3"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	prepgamesdirs
}

