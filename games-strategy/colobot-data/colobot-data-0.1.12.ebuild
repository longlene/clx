# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

DESCRIPTION="Colobot Data Files"
HOMEPAGE="https://github.com/colobot/colobot-data"
SRC_URI="https://github.com/colobot/colobot-data/archive/colobot-gold-${PV}-alpha.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="music"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DTRANSLATIONS=OFF
	-DMUSIC=$(usex music)
	)
	cmake_src_configure
}
