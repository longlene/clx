# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="An header-only socket library based on Asio which provides easy-to-use TCP servers and clients"
HOMEPAGE="https://github.com/streetdrone-home/sd_sockets"
SRC_URI="https://github.com/streetdrone-home/sd_sockets/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTING=OFF
	)
	cmake_src_configure
}
