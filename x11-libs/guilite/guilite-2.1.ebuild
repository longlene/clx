# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

DESCRIPTION="Small-Fast-Embeddable GUI library"
HOMEPAGE="https://github.com/idea4good/GuiLite"
SRC_URI="https://github.com/idea4good/GuiLite/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_USE_DIR="${S}"/workspace

src_prepare() {
	default
	sed -e '/execute_process/d' \
		-i workspace/CMakeLists.txt
	cmake_src_prepare
}

src_install() {
	dolib.a workspace/libGuiLite.a

	insinto /usr/include
	doins GuiLite.h

	dodoc README*.md
}
