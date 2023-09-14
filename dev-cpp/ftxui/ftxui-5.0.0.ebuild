# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="C++ Functional Terminal User Interface"
HOMEPAGE="https://github.com/ArthurSonzogni/FTXUI"
SRC_URI="https://github.com/ArthurSonzogni/FTXUI/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DFTXUI_BUILD_DOCS=OFF
		-DFTXUI_BUILD_EXAMPLES=OFF
	)
	cmake_src_configure
}
