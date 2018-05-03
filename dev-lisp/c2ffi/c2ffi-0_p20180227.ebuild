# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils llvm vcs-snapshot

EGIT_COMMIT="91fb8ad3a071f8759928faeeb976595ac9003241"

DESCRIPTION="Clang-based FFI wrapper generator"
HOMEPAGE="https://github.com/rpav/c2ffi"
SRC_URI="https://github.com/rpav/c2ffi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	>=sys-devel/llvm-6.0.0
"
RDEPEND="${DEPEND}"

LLVM_MAX_SLOT=6

src_prepare() {
	eapply_user
	sed -e '/find_package/{s#5.0#6.0#}' \
		-e "/link_directories/{s#lib#$(get_libdir)#}" \
		-i CMakeLists.txt
}
