# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="High-level CPP Binding for ZeroMQ"
HOMEPAGE="https://github.com/zeromq/cppzmq"
SRC_URI="https://github.com/zeromq/cppzmq/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64 ~arm x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND=">=net-libs/zeromq-4.2.1"
DEPEND=""

#PATCHES=( "${FILESDIR}/cppzmq-4.2.3-cmakeConfig.patch" )

src_prepare() {
	default
	cmake_src_prepare
	sed -i 's#ZeroMQ_LIBRARY AND#ZeroMQ_LIBRARY OR#' libzmq-pkg-config/FindZeroMQ.cmake
}

src_configure() {
	local mycmakeargs=(
	-DCPPZMQ_BUILD_TESTS=OFF
	)
	cmake_src_configure
}
