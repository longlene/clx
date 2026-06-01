# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

MDSPAN_VER="0.6.0"

DESCRIPTION="Universal model exchange format for decision tree forests"
HOMEPAGE="https://treelite.readthedocs.io/en/latest/ https://github.com/dmlc/treelite"
SRC_URI="
	https://github.com/dmlc/treelite/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/kokkos/mdspan/archive/refs/tags/mdspan-${MDSPAN_VER}.tar.gz -> mdspan-${MDSPAN_VER}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="openmp"

DEPEND="
	dev-libs/rapidjson
	dev-cpp/nlohmann_json
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DDETECT_CONDA_ENV=OFF
		-DBUILD_CPP_TEST=OFF
		-DUSE_OPENMP=$(usex openmp)
		-DFETCHCONTENT_FULLY_DISCONNECTED=ON
		-DFETCHCONTENT_SOURCE_DIR_MDSPAN="${WORKDIR}/mdspan-mdspan-${MDSPAN_VER}"
	)
	cmake_src_configure
}
