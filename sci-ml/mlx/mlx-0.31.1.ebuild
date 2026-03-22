# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit cmake distutils-r1

GGUF_TOOLS_COMMIT="8fa6eb65236618e28fd7710a0fba565f7faa1848"
NANOBIND_PV="2.10.2"

DESCRIPTION="Run your own AI cluster at home with everyday devices"
HOMEPAGE="https://github.com/ml-explore/mlx"
SRC_URI="
	https://github.com/ml-explore/mlx/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/antirez/gguf-tools/archive/${GGUF_TOOLS_COMMIT}.tar.gz -> gguf-tools-${GGUF_TOOLS_COMMIT}.tar.gz
	https://github.com/wjakob/nanobind/archive/refs/tags/v${NANOBIND_PV}.tar.gz -> nanobind-${NANOBIND_PV}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda python"

DEPEND="
	dev-cpp/nlohmann_json
	sci-libs/flexiblas
	cuda? (
		dev-util/nvidia-cuda-toolkit
	)
"
RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest

RESTRICT="test"

PATCHES=(
	"${FILESDIR}"/system-deps.patch
)

export DEBUG=1
export PYPI_RELEASE=1

pkg_setup() {
	use python && python_setup
}

src_prepare() {
	cmake_src_prepare
	use python && distutils-r1_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DMLX_BUILD_TESTS=OFF
		-DMLX_BUILD_EXAMPLES=OFF
		-DMLX_BUILD_METAL=OFF
		-DMLX_BUILD_CUDA=$(usex cuda ON OFF)
		-DBUILD_SHARED_LIBS=ON
		-DUSE_SYSTEM_FMT=ON
		-DFETCHCONTENT_SOURCE_DIR_GGUFLIB=${WORKDIR}/gguf-tools-${GGUF_TOOLS_COMMIT}
	)
	cmake_src_configure
	if use python ; then
		local myargs="${mycmakeargs[*]}"
		myargs+=" -DMLX_BUILD_PYTHON_BINDINGS=ON "
		myargs+=" -DFETCHCONTENT_SOURCE_DIR_NANOBIND=${WORKDIR}/nanobind-${NANOBIND_PV}"
		myargs+=" -DNB_USE_SUBMODULE_DEPS=OFF "
		export CMAKE_ARGS="${myargs}"
		distutils-r1_src_configure
	fi
}

src_compile() {
	cmake_src_compile
	use python && distutils-r1_src_compile
}

src_install() {
	cmake_src_install
	use python && distutils-r1_src_install
}
