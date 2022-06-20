# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="8efa4d35350d318324a8dc118b70f5935d4fe456"

DESCRIPTION="A tiny, URL-friendly, unique string ID generator for C++"
HOMEPAGE="https://github.com/mcmikecreations/nanoid_cpp"
SRC_URI="https://github.com/mcmikecreations/nanoid_cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTS=OFF
		-DBUILD_EXAMPLES=OFF
	)
	cmake_src_configure
}
