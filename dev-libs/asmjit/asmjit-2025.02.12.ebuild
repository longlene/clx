# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

CommitId=029075b84bf0161a761beb63e6eda519a29020db

DESCRIPTION="Machine code generation for C++"
HOMEPAGE="https://asmjit.com/"
SRC_URI="https://github.com/asmjit/${PN}/archive/${CommitId}.tar.gz
	-> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
S="${WORKDIR}"/${PN}-${CommitId}
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-cpp/gtest )"
RESTRICT="!test? ( test )"

src_configure() {
	mycmakeargs=(
		-DASMJIT_TEST=$(usex test)
	)
	cmake_src_configure
}
