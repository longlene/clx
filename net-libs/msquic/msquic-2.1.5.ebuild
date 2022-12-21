# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Cross-platform, C implementation of the IETF QUIC protocol"
HOMEPAGE="https://github.com/microsoft/msquic"
SRC_URI="
	https://github.com/microsoft/msquic/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/microsoft/CLOG/archive/refs/tags/0.3.0.tar.gz -> CLOG-0.3.0.tar.gz
	https://github.com/quictls/openssl/archive/c3d4eb57dc74ba18ce70acee68b9a086ccc806aa.tar.gz -> openssl-c3d4eb57dc74ba18ce70acee68b9a086ccc806aa.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir submodules/clog && ln -sf "${WORKDIR}"/CLOG-0.3.0 submodules/clog
	rmdir submodules/openssl && ln -sf "${WORKDIR}"/openssl-c3d4eb57dc74ba18ce70acee68b9a086ccc806aa submodules/openssl
	sed -e "/install/{s#DESTINATION lib#DESTINATION $(get_libdir)#}" -i src/bin/CMakeLists.txt
	cmake_src_prepare
}
