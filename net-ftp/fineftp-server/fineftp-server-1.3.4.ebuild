# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ FTP Server Library"
HOMEPAGE="https://github.com/eclipse-ecal/fineftp-server"
SRC_URI="
	https://github.com/eclipse-ecal/fineftp-server/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/chriskohlhoff/asio/archive/b84e6c16b2ea907dbad94206b7510d85aafc0b42.tar.gz -> asio-b84e6c16b2ea907dbad94206b7510d85aafc0b42.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir thirdparty/asio && ln -sv "${WORKDIR}"/asio-b84e6c16b2ea907dbad94206b7510d85aafc0b42 thirdparty/asio
	sed -e "s#DESTINATION \"lib\"#DESTINATION $(get_libdir)#" \
		-i fineftp-server/CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DFINEFTP_SERVER_BUILD_SAMPLES=OFF
	)
	cmake_src_configure
}
