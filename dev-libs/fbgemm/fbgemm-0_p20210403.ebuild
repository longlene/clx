# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="9c0408d0b161533cf031bb30c19ac2dfd3cbd21a"

DESCRIPTION="FB (Facebook) + GEMM (General Matrix-Matrix Multiplication)"
HOMEPAGE="https://github.com/pytorch/fbgemm"
SRC_URI="
	https://github.com/pytorch/fbgemm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	https://github.com/pytorch/cpuinfo/archive/5916273f79a21551890fd3d56fc5375a78d1598d.tar.gz -> cpuinfo-0_p20181217.tar.gz
	https://github.com/asmjit/asmjit/archive/a4dd0b2d8b0fdbcda777e4d6dae0e76636080113.tar.gz -> asmjit-0_p20210321.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DFBGEMM_LIBRARY_TYPE=shared
		-DFBGEMM_BUILD_TESTS=OFF
		-DFBGEMM_BUILD_BENCHMARKS=OFF
		-DCPUINFO_SOURCE_DIR="${WORKDIR}"/cpuinfo-0_p20181217
		-DASMJIT_SRC_DIR="${WORKDIR}"/asmjit-0_p20210321
	)
	cmake_src_configure
}

src_install() {
	insinto /usr/include
	doins -r include/fbgemm
	dolib.so "${BUILD_DIR}"/libfbgemm.so
	dodoc README.md
}
