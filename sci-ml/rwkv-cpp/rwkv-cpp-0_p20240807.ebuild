# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

EGIT_COMMIT="84fea2239fd9a8fcbb4944ac85da2c83cce9dcda"
GGML_COMMIT="3e7e5e26f90fecf4f7c2808df7d94454630b219c"

DESCRIPTION="INT4/INT5/INT8 and FP16 inference on CPU for RWKV language model"
HOMEPAGE="https://github.com/RWKV/rwkv.cpp"
SRC_URI="
	https://github.com/RWKV/rwkv.cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	https://github.com/ggerganov/ggml/archive/${GGML_COMMIT}.tar.gz -> ggml-${GGML_COMMIT}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/rwkv.cpp-${EGIT_COMMIT}

src_prepare() {
	default
	rmdir "${S}"/ggml && ln -sv "${WORKDIR}"/ggml-${GGML_COMMIT} "${S}"/ggml
	cmake_src_prepare
}

src_install() {
	insinto /usr/include
	doins rwkv.h
	dolib.so "${BUILD_DIR}"/librwkv.so
	einstalldocs
}
