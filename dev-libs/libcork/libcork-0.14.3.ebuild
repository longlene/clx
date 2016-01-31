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
	if ! use doc ; then
		sed -i '/add_subdirectory(doc/d' CMakeLists.txt
	fi

	if ! use test ; then
		sed -i '/add_subdirectory(tests/d' CMakeLists.txt
	fi
}

