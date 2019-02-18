# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="C/C++/ObjC language server supporting cross references, hierarchies, completion and semantic highlighting"
HOMEPAGE="https://github.com/MaskRay/ccls"
SRC_URI="https://github.com/MaskRay/ccls/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sys-devel/clang
	dev-libs/rapidjson
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DSYSTEM_CLANG=ON
	-DCMAKE_PREFIX_PATH="/usr/lib/llvm/7"
	)
	cmake-utils_src_configure
}

