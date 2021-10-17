# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Pacman using SDL"
HOMEPAGE="https://r6eve.github.io/project/pacman/"
SRC_URI="https://github.com/r6eve/pacman-sdl/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-libs/libsdl
	media-libs/sdl-image
	media-libs/sdl-mixer
	media-libs/sdl-ttf
"
RDEPEND="${DEPEND}"

src_install() {
	dobin ${PN}
	dodoc README.md
}
