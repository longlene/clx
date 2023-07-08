# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="779b99ac6656e4d30c3b24e96e0136a59649a869"

DESCRIPTION="OpenGL Image"
HOMEPAGE="https://github.com/g-truc/gli"
SRC_URI="https://github.com/g-truc/gli/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="HappyBunny"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="virtual/opengl"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DGLI_TEST_ENABLE=OFF
	)
	cmake_src_configure
}
