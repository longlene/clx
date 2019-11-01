# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

DESCRIPTION="Colobot: Gold Edition"
HOMEPAGE="http://colobot.info/"
SRC_URI="https://github.com/colobot/colobot/archive/colobot-gold-${PV}-alpha.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="openal"

DEPEND="
	media-libs/libsdl2
	media-libs/sdl2-image
	media-libs/sdl2-ttf
	media-libs/libpng:1.2
	sys-devel/gettext
	dev-games/physfs
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DOPENAL_SOUND=$(usex openal)
	)
	cmake-utils_src_configure
}
