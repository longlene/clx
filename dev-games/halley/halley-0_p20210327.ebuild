# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="6b5ff0b4e786c5fc390a7364785c8d8ad5aeb2e2"

DESCRIPTION="A lightweight game engine written in modern C++"
HOMEPAGE="https://github.com/amzeratul/halley"
SRC_URI="https://github.com/amzeratul/halley/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/boost
	media-libs/libsdl2
"
RDEPEND="${DEPEND}"
BDEPEND=""

