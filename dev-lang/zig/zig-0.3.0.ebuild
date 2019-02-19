# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils llvm

DESCRIPTION="robust, optimal, and clear programming language"
HOMEPAGE="https://ziglang.org"
SRC_URI="https://github.com/ziglang/zig/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="system-lld"

DEPEND="
	>=sys-devel/clang-7.0.1
	system-lld? ( sys-devel/lld )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i '/install(/{/ZIG_CPP_LIB_DIR/d}' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DZIG_FORCE_EXTERNAL_LLD=$(usex system-lld)
	)
	cmake-utils_src_configure
}
