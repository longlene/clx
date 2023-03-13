# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="A fast and flexible c++ template class for tree data structures"
HOMEPAGE="https://github.com/erikerlandson/st_tree"
SRC_URI="https://github.com/erikerlandson/st_tree/archive/refs/tags/version_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DENABLE_TESTS=OFF
	)
	cmake_src_configure
}
