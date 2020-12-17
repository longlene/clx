# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Cross-platform library for building Telegram clients"
HOMEPAGE="https://github.com/tdlib/td"
SRC_URI="https://github.com/tdlib/td/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/openssl
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DTD_ENABLE_JNI=OFF
	-DTD_ENABLE_DOTNET=OFF
	)
	cmake-utils_src_configure
}
