# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

MY_CPM_VER="0.42.0"

DESCRIPTION="Header-only C++20 runtime-controllable tracing library"
HOMEPAGE="https://github.com/zokrezyl/ytrace"
SRC_URI="
	https://github.com/zokrezyl/ytrace/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/cpm-cmake/CPM.cmake/releases/download/v${MY_CPM_VER}/CPM.cmake
		-> cpm-cmake-${MY_CPM_VER}.cmake
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="tools"

src_prepare() {
	# Pre-populate CPM download cache to prevent network access at configure time
	mkdir -p "${T}/cpm-cache/cpm" || die
	cp "${DISTDIR}/cpm-cmake-${MY_CPM_VER}.cmake" \
		"${T}/cpm-cache/cpm/CPM_${MY_CPM_VER}.cmake" || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCPM_SOURCE_CACHE="${T}/cpm-cache"
		-DYTRACE_WITH_SPDLOG=OFF
		-DYTRACE_BUILD_TESTS=OFF
		-DYTRACE_BUILD_EXAMPLES=OFF
		-DYTRACE_BUILD_TOOLS=$(usex tools)
	)
	cmake_src_configure
}

src_install() {
	# Install ytrace headers only; skip bundled include/args/
	insinto /usr/include
	doins -r "${S}/include/ytrace"

	use tools && dobin "${BUILD_DIR}/src/ytrace/ytrace-ctl"

	# Install cmake package config for find_package(ytrace) support
	cat > "${T}/ytraceConfig.cmake" <<-'EOF' || die
		if(NOT TARGET ytrace::ytrace)
		  add_library(ytrace::ytrace INTERFACE IMPORTED)
		  find_path(_ytrace_incdir ytrace/ytrace.hpp REQUIRED)
		  target_include_directories(ytrace::ytrace INTERFACE "${_ytrace_incdir}")
		  target_compile_features(ytrace::ytrace INTERFACE cxx_std_20)
		  unset(_ytrace_incdir)
		  set(ytrace_FOUND TRUE)
		endif()
	EOF
	insinto /usr/lib/cmake/ytrace
	doins "${T}/ytraceConfig.cmake"
}
