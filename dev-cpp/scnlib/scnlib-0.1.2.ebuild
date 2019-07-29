# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="scanf for modern C++"
HOMEPAGE="https://scnlib.dev"
SRC_URI="https://github.com/eliaskosunen/scnlib/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DSCN_TESTS=OFF
		-DSCN_EXAMPLES=OFF
		-DSCN_BENCHMARKS=OFF
		-DSCN_DOCS=OFF
	)
	cmake-utils_src_configure
}

