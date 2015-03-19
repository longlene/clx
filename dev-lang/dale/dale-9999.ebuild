# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils git-2

DESCRIPTION="Lisp-flavoured C"
HOMEPAGE="https://github.com/tomhrr/dale"
SRC_URI=""

EGIT_REPO_URI="https://github.com/tomhrr/dale.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
sys-libs/ncurses[tinfo]
sys-devel/llvm[clang]
dev-libs/libffi
"
RDEPEND="${DEPEND}"

CMAKE_BUILD_TYPE=Release

src_prepare() {
	sed -i 's/man\/man1/share\/man\/man1/' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
		-DFFI_INCLUDE_DIR="$(pkg-config --variable=includedir libffi)"
	)
	cmake-utils_src_configure
}
