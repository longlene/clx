# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

MY_PV=${PV//./-}

DESCRIPTION="Monterey theme for KDE plasma"
HOMEPAGE="https://github.com/vinceliuice/Monterey-kde"
SRC_URI="https://github.com/vinceliuice/Monterey-kde/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/share/color-schemes
	doins color-schemes/Monterey{,Dark}.colors
	insinto /usr/share/plasma/desktoptheme
	doins -r plasma/desktoptheme/Monterey{,-dark}
	insinto /usr/share/plasma/look-and-feel
	doins -r plasma/look-and-feel/com.github.vinceliuice.Monterey{,-dark}
	insinto /usr/share/wallpapers
	doins -r wallpaper/Monterey{,-dark}
	einstalldocs
}
