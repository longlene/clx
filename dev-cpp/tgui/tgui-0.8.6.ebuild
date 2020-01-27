# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="An easy to use cross-platform c++ GUI for SFML"
HOMEPAGE="https://github.com/texus/TGUI"
SRC_URI="https://github.com/texus/TGUI/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-libs/libsfml
"
RDEPEND="${DEPEND}"
BDEPEND=""
