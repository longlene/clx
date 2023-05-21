# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C/C++ WebRTC network library"
HOMEPAGE="https://libdatachannel.org/"
SRC_URI="
	https://github.com/paullouisageneau/libdatachannel/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/nlohmann/json/archive/4f8fba14066156b73f1189a2b8bd568bde5284c5.tar.gz -> json-4f8fba14066156b73f1189a2b8bd568bde5284c5.tar.gz
	https://github.com/SergiusTheBest/plog/archive/d8461e9d473e59fbcc1f79eee021550dcf81e618.tar.gz -> plog-d8461e9d473e59fbcc1f79eee021550dcf81e618.tar.gz
	https://github.com/sctplab/usrsctp/archive/7c31bd35c79ba67084ce029511193a19ceb97447.tar.gz -> usrsctp-7c31bd35c79ba67084ce029511193a19ceb97447.tar.gz
"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gnutls"

DEPEND="
	dev-libs/libjuice
	net-libs/libsrtp
	gnutls? ( net-libs/gnutls )
	!gnutls? ( dev-libs/openssl )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir deps/json && ln -sv "${WORKDIR}"/json-4f8fba14066156b73f1189a2b8bd568bde5284c5 deps/json
	rmdir deps/plog && ln -sv "${WORKDIR}"/plog-d8461e9d473e59fbcc1f79eee021550dcf81e618 deps/plog
	rmdir deps/usrsctp && ln -sv "${WORKDIR}"/usrsctp-7c31bd35c79ba67084ce029511193a19ceb97447 deps/usrsctp
	sed -e "/DESTINATION/{s# lib\$# $(get_libdir)#}" \
		-i CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUSE_GNUTLS=$(usex gnutls)
		-DUSE_SYSTEM_SRTP=ON
		-DUSE_SYSTEM_JUICE=ON
		-DNO_EXAMPLES=ON
		-DNO_TESTS=ON
	)
	cmake_src_configure
}
