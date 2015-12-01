# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit gnome2

DESCRIPTION="A simple tool for modifying PDF documents"
HOMEPAGE="http://live.gnome.org/PdfMod"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="
	>=dev-lang/mono-2.4.2
	>=dev-dotnet/gtk-sharp-2.12
	>=dev-dotnet/gnome-sharp-2.24.1"

DOCS="AUTHORS NEWS"

