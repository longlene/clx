# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Lightweight STUN/TURN server"
HOMEPAGE="https://github.com/paullouisageneau/violet"
SRC_URI="https://github.com/paullouisageneau/violet/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/libjuice"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DUSE_SYSTEM_JUICE=ON
	)
	cmake_src_configure
}
