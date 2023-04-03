# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A beautiful stack trace pretty printer for C++"
HOMEPAGE="https://github.com/bombela/backward-cpp"
SRC_URI="https://github.com/bombela/backward-cpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DBACKWARD_TESTS=OFF
	)
	cmake_src_configure
}
