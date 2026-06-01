# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="Lightning-fast on-device multilingual TTS inference helper via ONNX"
HOMEPAGE="https://github.com/supertone-inc/supertonic"
SRC_URI="https://github.com/supertone-inc/supertonic/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/supertonic-${PV}/py"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		>=dev-python/numpy-1.26.0[${PYTHON_USEDEP}]
		>=sci-libs/onnxruntime-1.23.1[python,${PYTHON_USEDEP}]
		>=dev-python/soundfile-0.12.1[${PYTHON_USEDEP}]
		>=dev-python/librosa-0.10.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	')
"
BDEPEND="$(python_gen_cond_dep 'dev-python/setuptools[${PYTHON_USEDEP}]')"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_prepare() {
	sed -i 's/py-modules = \[\]/py-modules = ["helper"]/' pyproject.toml || die
	distutils-r1_src_prepare
}

python_install_all() {
	distutils-r1_python_install_all
	python_newexe "${S}/example_onnx.py" supertonic-tts-onnx
	dodoc README.md
}
