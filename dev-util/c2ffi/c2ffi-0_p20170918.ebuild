# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="014b635a690a6508679d60c9b719b2d32d039711"

DESCRIPTION="Clang-based FFI wrapper generator"
HOMEPAGE="https://github.com/rpav/c2ffi"
SRC_URI="https://github.com/rpav/c2ffi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	>=sys-devel/llvm-3.9.0
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed '/find_package/{s#4.0#3.9#}' -i CMakeLists.txt
}
