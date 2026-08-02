# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 multiprocessing

DESCRIPTION="Community tools for converting and editing Core ML models"
HOMEPAGE="https://github.com/apple/coremltools"
SRC_URI="https://github.com/apple/coremltools/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

DEPEND="
	sys-apps/util-linux
"
RDEPEND="
	${DEPEND}
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		>=dev-python/numpy-1.14.5[${PYTHON_USEDEP}]
		>=dev-python/protobuf-3.1.0[${PYTHON_USEDEP}]
		dev-python/sympy[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		>=dev-python/attrs-21.3.0[${PYTHON_USEDEP}]
		dev-python/cattrs[${PYTHON_USEDEP}]
		dev-python/pyaml[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	${PYTHON_DEPS}
	dev-build/cmake
"

python_configure() {
	cmake -S "${S}" -B "${WORKDIR}/cmake-build" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
		-DPYTHON_EXECUTABLE="${PYTHON}" \
		|| die
}

python_compile() {
	cmake --build "${WORKDIR}/cmake-build" -j"$(makeopts_jobs)" || die
	distutils-r1_python_compile
}
