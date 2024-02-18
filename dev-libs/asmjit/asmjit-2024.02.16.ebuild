# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

CommitId=4e50d8b319d637c5f95aac4394738c5c5bd8e571

DESCRIPTION="Machine code generation for C++"
HOMEPAGE="https://asmjit.com/"
SRC_URI="https://github.com/asmjit/${PN}/archive/${CommitId}.tar.gz
	-> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="test? ( dev-cpp/gtest )"
RESTRICT="!test? ( test )"

S="${WORKDIR}"/${PN}-${CommitId}

src_configure() {
	mycmakeargs=(
		-DASMJIT_TEST=$(usex test)
	)
	cmake_src_configure
}
