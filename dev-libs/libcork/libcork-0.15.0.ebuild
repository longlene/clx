# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit cmake-utils

DESCRIPTION="A simple, easily embeddable cross-platform C library"
HOMEPAGE="https://github.com/redjack/libcork"
SRC_URI="mirror://github/redjack/libcork/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="doc test"

DEPEND=""
RDEPEND="${DEPEND}
test? ( dev-libs/check )
doc? ( dev-python/sphinx )"

src_prepare() {
	sed -i '45,55d' CMakeLists.txt
	sed -i '23,35d' CMakeLists.txt
	use doc || sed -i '/add_subdirectory(doc/d' CMakeLists.txt
	use test || sed -i '/add_subdirectory(tests/d' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DBASE_VERSION=${PV}
	)
	cmake-utils_src_configure
}
