# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION=""
HOMEPAGE="https://github.com/OWNER/REPO/"
SRC_URI="https://github.com/OWNER/REPO/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
	dep1/dep1:=
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
	test? ( dev-libs/gtest )
"

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTING=$(usex test ON OFF)
		-DBUILD_SHARED_LIBS=ON
		# -DENABLE_FEATURE=$(usex feature ON OFF)
		# If project uses FetchContent for bundled deps that aren't in portage:
		# -DFETCHCONTENT_FULLY_DISCONNECTED=ON
		# -DFETCHCONTENT_SOURCE_DIR_DEPNAME="${WORKDIR}/dep-repo-${MY_DEP_VER}"
	)
	cmake_src_configure
}
