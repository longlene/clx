# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A tiny boost library in C++11"
HOMEPAGE="https://github.com/idealvin/coost"
SRC_URI="https://github.com/idealvin/coost/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="curl ssl"

DEPEND="
	curl? ( net-misc/curl )
	ssl? ( dev-libs/openssl )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DWITH_LIBCURL=$(usex curl)
		-DWITH_OPENSSL=$(usex ssl)
		-DFPIC=ON
	)
	cmake_src_configure
}
