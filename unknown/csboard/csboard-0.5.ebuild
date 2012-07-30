# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2 mono

DESCRIPTION="CS-Board is a GUI for GnuChess using GTK# and Mono"
HOMEPAGE="http://csboard.berlios.de/"
SRC_URI="http://download.berlios.de/csboard/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="book"

RDEPEND=">=games-board/gnuchess-5.07
	>=x11-libs/gtk+-2.4
	>=dev-lang/mono-0.95
	>=dev-dotnet/gtk-sharp-0.93
	>=dev-dotnet/glade-sharp-0.93
	>=dev-dotnet/rsvg-sharp-0.93
	>=dev-dotnet/gconf-sharp-0.93
	book? (games-board/gnuchess-book)"
