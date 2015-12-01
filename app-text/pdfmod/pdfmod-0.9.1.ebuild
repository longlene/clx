# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit gnome2 mono

DESCRIPTION="A simple tool for modifying PDF documents"
HOMEPAGE="http://live.gnome.org/PdfMod"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-lang/mono-2
	>=dev-dotnet/gtk-sharp-2.0
	>=dev-dotnet/gconf-sharp-2.0
	app-text/gnome-doc-utils
	>=app-text/poppler-0.8.0
	>=dev-dotnet/hyena-0.5"

RDEPEND="${DEPEND}"

DOCS="AUTHORS NEWS README"

src_prepare() {
	epatch "${FILESDIR}"/pdfmod-mono-2.10.patch
	cp ${FILESDIR}/poppler-sharp.dll.config lib/poppler-sharp/poppler-sharp
}

