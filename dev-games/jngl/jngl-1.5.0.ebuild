# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Just a Neat Game Library"
HOMEPAGE="https://github.com/jhasse/jngl"
SRC_URI="https://github.com/jhasse/jngl/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/boost
	media-libs/libsdl2
	media-libs/libtheora
	virtual/jpeg
	media-libs/libpng
	media-libs/openal
"
RDEPEND="${DEPEND}"
BDEPEND=""
