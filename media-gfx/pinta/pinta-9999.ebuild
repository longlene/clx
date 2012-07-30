# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils mono git

EGIT_REPO_URI="http://github.com/jpobst/Pinta.git"

DESCRIPTION="Simple Painting for Gtk"
HOMEPAGE="http://pinta-project.com"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-lang/mono
    dev-dotnet/gtk-sharp"

DEPEND="${RDEPEND}"

src_compile() {
	xbuild Pinta.sln || die "xbuild failed"
	xbuild Pinta/Pinta.csproj || die "xbuild failed"
}

src_install() {
	dodir /usr/$(get_libdir)/${PN}
	insinto /usr/$(get_libdir)/${PN}
	doins bin/*.{dll,exe}

	make_wrapper ${PN} "/usr/bin/mono /usr/$(get_libdir)/${PN}/Pinta.exe"

	newicon "Pinta.Resources/Resources/Pinta.png" ${PN}.png
	make_desktop_entry ${PN} "Pinta Image Editor" ${PN}
}
