# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A top-down 2d game engine"
HOMEPAGE="https://github.com/ryanpcmcquen/basque"
SRC_URI="https://github.com/ryanpcmcquen/basque/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-libs/sdl2-image
	media-libs/sdl2-mixer
	media-libs/sdl2-ttf
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin basque
	dodoc README.md
}
