# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

EGIT_COMMIT="d1bc25ec4660cddd87804fcf03b2411b5dfb2e94"

DESCRIPTION="A compute library containing processor optimized GEMM kernels and platform specific threading code"
HOMEPAGE="https://github.com/openvinotoolkit/mlas"
SRC_URI="https://github.com/openvinotoolkit/mlas/archive/${EGIT_COMMIT}.tar.gz -> mlas-${EGIT_COMMIT}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/mlas-${EGIT_COMMIT}

#QA_WX_LOAD="usr/lib*/libmlas.a*"

src_install() {
	dolib.a "${BUILD_DIR}"/libmlas.a
	doheader inc/mlas{,_float16}.h
	einstalldocs
}
