# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="D++ Extremely Lightweight C++ Discord Bot Library"
HOMEPAGE="https://dpp.dev/"
SRC_URI="https://github.com/brainboxdotcc/DPP/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	sys-libs/zlib
	dev-libs/openssl
	dev-libs/libsodium
	media-libs/opus
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DDPP_BUILD_TEST=OFF
	)
	cmake_src_configure
}
