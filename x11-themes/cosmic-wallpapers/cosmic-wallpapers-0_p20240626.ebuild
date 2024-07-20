# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="0f2f16dc39ff1281a56680e37719e98a1bc8cb99"

DESCRIPTION="A collection of wallpapers for the COSMIC Desktop Environment"
HOMEPAGE="https://github.com/pop-os/cosmic-wallpapers"
SRC_URI="https://github.com/pop-os/cosmic-wallpapers/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
