# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="The Loli programming language"
HOMEPAGE="http://loli-lang.ml/"
SRC_URI="https://github.com/loli-foundation/loli/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i '/set/{/CMAKE_C_FLAGS/d}' CMakeLists.txt
}

src_install() {
	dobin ${BUILD_DIR}/loli
	dolib.so ${BUILD_DIR}/libloli.so
	dodoc README.md
}
