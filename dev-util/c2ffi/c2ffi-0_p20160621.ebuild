# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="2c2bc76ba76e95adcf897589f4be7dbcb023afaf"

DESCRIPTION="Clang-based FFI wrapper generator"
HOMEPAGE="https://github.com/rpav/c2ffi"
SRC_URI="https://github.com/rpav/c2ffi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	>=sys-devel/llvm-3.7.0
"
RDEPEND="${DEPEND}"

src_prepare() {
	sed '/find_package/{s#3.7#3.9#}' -i CMakeLists.txt
}
