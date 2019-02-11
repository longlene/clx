# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Boost.asio based Redis-client library"
HOMEPAGE="https://github.com/nekipelov/redisclient"
SRC_URI="https://github.com/nekipelov/redisclient/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DBUILD_TEST=OFF
	-DBUILD_EXAMPLES=OFF
	)
	cmake-utils_src_configure
}
