# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Discord RPC"
HOMEPAGE="https://github.com/discord/discord-rpc"
SRC_URI="https://github.com/discord/discord-rpc/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/rapidjson
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DBUILD_EXAMPLES=OFF
	)
	cmake_src_configure
}
