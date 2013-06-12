# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2

DESCRIPTION="Clang-based FFI wrapper generator"
HOMEPAGE="https://github.com/rpav/c2ffi"
SRC_URI=""

EGIT_REPO_URI="https://github.com/rpav/c2ffi.git"

LICENSE="LGPL-2"
SLOT="0"
#KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	./autogen
	mkdir build
	cd build
	../configure
	emake
}

src_install() {
	do_bin src/c2ffi
}
