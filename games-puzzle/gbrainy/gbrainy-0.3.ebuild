# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games mono

DESCRIPTION="gbrainy is a brain teaser game and trainer to have fun and to keep
your brain trained."
HOMEPAGE="http://live.gnome.org/gbrainy"
SRC_URI="http://www.softcatala.org/~jmas/gbrainy/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=x11-libs/cairo-1.2
		>=dev-lang/mono-1.1.7
		dev-util/intltool
		>=gnome-base/libgnome-2.2
		>=dev-dotnet/gtk-sharp-2.8"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	prepgamesdirs
}	
