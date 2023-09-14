# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="2ce1d482e9445a97e44a42ddf393597d23dab97c"

DESCRIPTION="library for SSL over ustream"
HOMEPAGE="http://wiki.openwrt.org/"
SRC_URI="https://git.openwrt.org/?p=project/ustream-ssl.git;a=snapshot;h=${EGIT_COMMIT};sf=tgz -> ${P}.tar.gz"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="mbedtls"

RDEPEND="
	dev-libs/libubox
	mbedtls? ( net-libs/mbedtls )
	!mbedtls? ( dev-libs/openssl )
"

src_prepare() {
	default
	sed -e 's/-Werror //' \
		-e "/LIBRARY DESTINATION/{s#lib#$(get_libdir)#}" \
		-i CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
	-DMBEDTLS=$(usex mbedtls)
	)
	cmake_src_configure
}
