# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )

inherit cmake python-any-r1

# Versions pinned by the CPMAddPackage calls in CMakeLists.txt.
GTEST_VER="1.17.0"
SIMDJSON_VER="4.0.6"
SIMDUTF_VER="7.0.0"

DESCRIPTION="C++ library for IDNA (international domain name) processing"
HOMEPAGE="https://github.com/ada-url/idna"
SRC_URI="https://github.com/ada-url/idna/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	test? (
		https://github.com/google/googletest/archive/refs/tags/v${GTEST_VER}.tar.gz -> googletest-${GTEST_VER}.tar.gz
		https://github.com/simdjson/simdjson/archive/refs/tags/v${SIMDJSON_VER}.tar.gz -> simdjson-${SIMDJSON_VER}.tar.gz
	)
	simdutf? (
		https://github.com/simdutf/simdutf/archive/refs/tags/v${SIMDUTF_VER}.tar.gz -> simdutf-${SIMDUTF_VER}.tar.gz
	)
"

LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="simdutf test"
RESTRICT="!test? ( test )"

BDEPEND="
	test? ( ${PYTHON_DEPS} )
"

src_configure() {
	local mycmakeargs=(
		-DADA_USE_SIMDUTF=$(usex simdutf)
		-DBUILD_TESTING=$(usex test)
	)
	# Upstream fetches deps via CPM - point it at the distfiles instead.
	use test && mycmakeargs+=(
		-DCPM_GTest_SOURCE="${WORKDIR}/googletest-${GTEST_VER}"
		-DCPM_simdjson_SOURCE="${WORKDIR}/simdjson-${SIMDJSON_VER}"
	)
	use simdutf && mycmakeargs+=(
		-DCPM_simdutf_SOURCE="${WORKDIR}/simdutf-${SIMDUTF_VER}"
	)
	cmake_src_configure
}
