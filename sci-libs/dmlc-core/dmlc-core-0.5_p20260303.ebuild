# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake toolchain-funcs vcs-snapshot

EGIT_COMMIT="5295de940c7e79abe8b5d3891ca1d9ac6e7d467c"

DESCRIPTION="Common bricks library for building distributed machine learning"
HOMEPAGE="https://github.com/dmlc/dmlc-core"
SRC_URI="https://github.com/dmlc/${PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64 ~x86"
LICENSE="Apache-2.0"
SLOT="0"

# hdfs needs big java hdfs not yet in portage
# azure not yet in portage
IUSE="cpu_flags_x86_sse2 doc openmp s3 test"
RESTRICT="!test? ( test )"

RDEPEND="s3? ( net-misc/curl[ssl] )"
DEPEND="${RDEPEND}"
BDEPEND="doc? ( app-text/doxygen[dot] )
	test? ( dev-cpp/gtest )"

pkg_pretend() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

pkg_setup() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

src_prepare() {
	cmake_src_prepare

	sed -e '/-O3/d' -e '/check_cxx_compiler_flag("-msse2"/d' \
		-e '/check_cxx.*SSE2/d' \
		-i CMakeLists.txt || die

	# All these hacks below to allow testing
	sed -e 's|-O3||' -e 's|-std=c++11|-std=c++14|' \
		-e "s|-lm|-lm -L\"${BUILD_DIR}\" -ldmlc|g" \
		-i Makefile || die
	cat <<-EOF > config.mk
		USE_SSE=$(usex cpu_flags_x86_sse2 1 0)
		WITH_FPIC=1
		USE_OPENMP=$(usex openmp 1 0)
		USE_S3=$(usex s3 1 0)
		BUILD_TEST=$(usex test 1 0)
		DMLC_CFLAGS=${CXXFLAGS}
		DMLC_LDFLAGS=${LDFLAGS}
	EOF
}

src_configure() {
	local mycmakeargs=(
		-DGOOGLE_TEST=$(usex test)
		-DSUPPORT_MSSE2=$(usex cpu_flags_x86_sse2)
		-DUSE_S3=$(usex s3)
		-DUSE_OPENMP=$(usex openmp)
	)

	cmake_src_configure
}

src_compile() {
	cmake_src_compile

	use doc && emake doxygen
	use test && emake test
}

src_test() {
	DMLC_UNIT_TEST_LITTLE_ENDIAN=$([[ $(tc-endian) == little ]] && echo 1 || echo 0) \
	LD_LIBRARY_PATH="${BUILD_DIR}" \
		test/unittest/dmlc_unittest || die

	cmake_src_test
}

src_install() {
	cmake_src_install

	if use doc; then
		dodoc -r doc/doxygen/html
		docompress -x /usr/share/doc/${PF}/html
	fi
}
