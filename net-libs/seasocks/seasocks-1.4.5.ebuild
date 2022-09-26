# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Simple, small, C++ embeddable webserver with WebSockets support"
HOMEPAGE="https://github.com/mattgodbolt/seasocks"
SRC_URI="https://github.com/mattgodbolt/seasocks/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DUNITTESTS=OFF
		-DSEASOCKS_EXAMPLE_APP=OFF
	)
	cmake_src_configure
}
