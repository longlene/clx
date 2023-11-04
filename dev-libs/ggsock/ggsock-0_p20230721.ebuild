# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="25ea97004a2f6e8a416dfe99ed3de266787a50d5"

DESCRIPTION="Non-blocking sockets wrapper"
HOMEPAGE="https://github.com/ggerganov/ggsock"
SRC_URI="https://github.com/ggerganov/ggsock/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e "/DESTINATION/{s#DESTINATION lib#DESTINATION $(get_libdir)#}" \
		-i src/CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DGGSOCK_BUILD_EXAMPLES=OFF
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	insinto /usr/include
	doins -r include/ggsock
}
