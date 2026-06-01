# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="The Universal Storage Engine"
HOMEPAGE="https://tiledb.com"
SRC_URI="https://github.com/TileDB-Inc/TileDB/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/TileDB-${PV}"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="webp"

DEPEND="
	app-arch/bzip2
	app-arch/lz4
	app-arch/zstd:=
	dev-cpp/nlohmann_json
	dev-libs/c-blosc2:=
	dev-libs/openssl:=
	dev-libs/spdlog:=
	virtual/zlib
	webp? ( media-libs/libwebp:= )
"
RDEPEND="${DEPEND}"

src_prepare() {
	# Gentoo's zstd lacks cmake config files; provide a Find module that
	# creates the zstd::libzstd target via pkg-config and drop CONFIG mode.
	cat > cmake/Modules/Findzstd.cmake <<'EOF'
find_package(PkgConfig QUIET)
if(PkgConfig_FOUND)
	pkg_check_modules(PC_ZSTD QUIET libzstd)
endif()

find_library(ZSTD_LIBRARY NAMES zstd HINTS ${PC_ZSTD_LIBRARY_DIRS})
find_path(ZSTD_INCLUDE_DIR NAMES zstd.h HINTS ${PC_ZSTD_INCLUDE_DIRS})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(zstd
	REQUIRED_VARS ZSTD_LIBRARY ZSTD_INCLUDE_DIR
	VERSION_VAR PC_ZSTD_VERSION
)

if(zstd_FOUND AND NOT TARGET zstd::libzstd)
	add_library(zstd::libzstd SHARED IMPORTED)
	set_target_properties(zstd::libzstd PROPERTIES
		IMPORTED_LOCATION "${ZSTD_LIBRARY}"
		INTERFACE_INCLUDE_DIRECTORIES "${ZSTD_INCLUDE_DIR}"
	)
endif()

mark_as_advanced(ZSTD_LIBRARY ZSTD_INCLUDE_DIR)
EOF
	# Drop CONFIG mode so cmake uses our Find module instead
	sed -i 's/find_package(zstd CONFIG REQUIRED)/find_package(zstd REQUIRED)/g' \
		tiledb/CMakeLists.txt \
		tiledb/sm/compressors/CMakeLists.txt || die

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DTILEDB_DISABLE_AUTO_VCPKG=ON
		-DTILEDB_WERROR=OFF
		-DTILEDB_TESTS=OFF
		-DTILEDB_TOOLS=OFF
		-DTILEDB_S3=OFF
		-DTILEDB_AZURE=OFF
		-DTILEDB_GCS=OFF
		-DTILEDB_SERIALIZATION=OFF
		-DTILEDB_WEBP=$(usex webp)
	)
	cmake_src_configure
}
