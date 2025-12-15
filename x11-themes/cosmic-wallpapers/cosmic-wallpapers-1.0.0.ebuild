# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

DESCRIPTION="A collection of wallpapers for the COSMIC Desktop Environment"
HOMEPAGE="https://github.com/pop-os/cosmic-wallpapers"
SRC_URI="https://github.com/pop-os/cosmic-wallpapers/archive/epoch-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/share/backgrounds
	doins original/*.jpg
	einstalldocs
}
