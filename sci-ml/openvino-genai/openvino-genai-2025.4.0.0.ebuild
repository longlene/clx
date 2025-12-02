# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_OPTIONAL=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=no
PYTHON_COMPAT=( python3_{11..14} )

inherit cmake distutils-r1

GGUF_TOOLS_COMMIT="bac796ada809ac293e685db59b075971181cb008"

DESCRIPTION="Run Generative AI models with simple C++/Python API and using OpenVINO Runtime"
HOMEPAGE="https://github.com/openvinotoolkit/openvino.genai"
SRC_URI="
	https://github.com/openvinotoolkit/openvino.genai/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/Lourdle/gguf-tools/archive/${GGUF_TOOLS_COMMIT}.tar.gz -> gguf-tools-${GGUF_TOOLS_COMMIT}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="python"

#	dev-cpp/jinja2cpp
DEPEND="
	sci-ml/openvino[python?]
	dev-libs/minja
	dev-cpp/nlohmann_json
	dev-libs/safetensors
	dev-libs/cxxopts
"
RDEPEND="${DEPEND}
	python? ( ${PYTHON_DEPS})
"
BDEPEND="
	python? (
		${PYTHON_DEPS}
		${DISTUTILS_DEPS}
		$(python_gen_cond_dep '
			dev-python/pybind11[${PYTHON_USEDEP}]
		')
	)
"
REQUIRED_USE="
	python? ( ${PYTHON_REQUIRED_USE} )
"

RESTRICT="test"

PATCHES=(
	"${FILESDIR}"/build-fix.patch
	"${FILESDIR}"/install-path.patch
)

export gguflib_SOURCE_DIR="${WORKDIR}"/gguf-tools-${GGUF_TOOLS_COMMIT}

S="${WORKDIR}"/openvino.genai-${PV}

pkg_setup() {
	use python && python_setup
}

src_configure() {
	rm -rf samples
	local mycmakeargs=(
		-DBUILD_TOKENIZERS=OFF
		-DENABLE_PYTHON=$(usex python)
		-DENABLE_SAMPLES=OFF
		-DENABLE_TOOLS=OFF
		-DENABLE_TESTS=OFF
		-DENABLE_XGRAMMAR=OFF
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	use python && python_optimize
}
