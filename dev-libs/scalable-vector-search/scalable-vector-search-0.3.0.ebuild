# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

MY_TOML_PV="3.3.0"

DESCRIPTION="Intel high-performance approximate nearest-neighbor search library"
HOMEPAGE="https://intel.github.io/ScalableVectorSearch/"
SRC_URI="
	https://github.com/intel/ScalableVectorSearch/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.tar.gz
	https://github.com/marzer/tomlplusplus/archive/refs/tags/v${MY_TOML_PV}.tar.gz
		-> tomlplusplus-${MY_TOML_PV}.tar.gz
"

S="${WORKDIR}/ScalableVectorSearch-${PV}"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="numa"
RESTRICT="test"

DEPEND="
	dev-cpp/eve
	dev-libs/libfmt:=
	dev-libs/spdlog:=
	dev-cpp/robin-map
	numa? ( sys-process/numactl )
"
RDEPEND="${DEPEND}"

src_prepare() {
	# Replace FetchContent declarations with find_package for system libraries.
	# spdlog must be built with SPDLOG_FMT_EXTERNAL=yes (system spdlog satisfies this).
	printf '%s\n' \
		'find_package(eve REQUIRED)' \
		'target_link_libraries(${SVS_LIB} INTERFACE eve::eve)' \
		> cmake/eve.cmake || die

	printf '%s\n' \
		'find_package(fmt CONFIG REQUIRED)' \
		'target_link_libraries(${SVS_LIB} INTERFACE fmt::fmt)' \
		> cmake/fmt.cmake || die

	printf '%s\n' \
		'find_package(spdlog CONFIG REQUIRED)' \
		'target_link_libraries(${SVS_LIB} INTERFACE spdlog::spdlog)' \
		> cmake/spdlog.cmake || die

	printf '%s\n' \
		'find_package(tsl-robin-map CONFIG REQUIRED)' \
		'target_link_libraries(${SVS_LIB} INTERFACE tsl::robin_map)' \
		> cmake/robin-map.cmake || die

	# The tomlplusplus FetchContent PATCH_COMMAND uses git-apply which requires a
	# git repository and fails in the network sandbox.  Apply the patch ourselves
	# to the pre-extracted bundled source before cmake sees it.
	patch -d "${WORKDIR}/tomlplusplus-${MY_TOML_PV}" -p1 \
		< "${S}/cmake/patches/tomlplusplus_v330.patch" || die

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DSVS_BUILD_BINARIES=OFF
		-DSVS_BUILD_TESTS=OFF
		-DSVS_BUILD_EXAMPLES=OFF
		-DSVS_BUILD_BENCHMARK=OFF
		-DSVS_EXPERIMENTAL_ENABLE_NUMA=$(usex numa)
		-DFETCHCONTENT_FULLY_DISCONNECTED=ON
		-DFETCHCONTENT_SOURCE_DIR_TOMLPLUSPLUS="${WORKDIR}/tomlplusplus-${MY_TOML_PV}"
	)
	cmake_src_configure
}
