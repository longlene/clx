# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Zukitwo theme"
HOMEPAGE="http://gnome-look.org/content/show.php/Zukitwo?content=140562"
SRC_URI="http://gnome-look.org/CONTENT/content-files/140562-Zukitwo.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gtk3"

DEPEND=""
RDEPEND="${DEPEND}
	gtk3? ( x11-themes/gtk3-engines-unico )
	>=x11-themes/gtk-engines-murrine-0.98.1.1
	x11-themes/gtk-engines"

S="${WORKDIR}"

src_install() {
	insinto /usr/share/themes
	for THEME in `find . -maxdepth 1 -type d -iname "zukitwo*"`; do
		doins -r ${THEME}
	done
}
