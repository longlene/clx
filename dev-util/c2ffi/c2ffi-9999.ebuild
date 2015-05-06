# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2

DESCRIPTION="Clang-based FFI wrapper generator"
HOMEPAGE="https://github.com/rpav/c2ffi"
SRC_URI=""

EGIT_REPO_URI="https://github.com/rpav/c2ffi.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86"
IUSE=""

DEPEND="
>=sys-devel/llvm-3.5.0
"
RDEPEND="${DEPEND}"

src_configure() {
	./autogen && econf
}

src_install() {
	dobin src/c2ffi
	dodoc README.md
}
