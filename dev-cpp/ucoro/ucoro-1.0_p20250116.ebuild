# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="30e06b28983b90f6a7ccfdb06d2c67547bc0b991"

DESCRIPTION="µcoro"
HOMEPAGE="https://github.com/avplayer/ucoro"
SRC_URI="https://github.com/avplayer/ucoro/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DUCORO_BUILD_TESTING=OFF
	)
	cmake_src_configure
}
