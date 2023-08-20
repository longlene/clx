# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="wolfSSL Embedded SSL/TLS Library"
HOMEPAGE="https://www.wolfssl.com/"
SRC_URI="https://github.com/wolfSSL/wolfssl/archive/refs/tags/v${PV}-stable.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e "/DESTINATION lib/{s#DESTINATION lib#DESTINATION $(get_libdir)#}" \
		-i CMakeLists.txt
	cmake_src_prepare
}
