# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Lightweight text-to-speech framework for fast local inference"
HOMEPAGE="https://github.com/RapidAI/RapidTTS"
SRC_URI="https://github.com/RapidAI/RapidTTS/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
PATCHES=( "${FILESDIR}"/rapid-tts-1.3.1-setup-py-fix.patch )

S="${WORKDIR}/RapidTTS-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/tokenizers[${PYTHON_SINGLE_USEDEP}]
	sci-ml/sentencepiece[python(+),${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/onnxruntime[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		dev-python/colorlog[${PYTHON_USEDEP}]
		dev-python/soundfile[${PYTHON_USEDEP}]
		sci-ml/wetext[${PYTHON_USEDEP}]
		media-libs/libsndfile
		dev-python/cn2an[${PYTHON_USEDEP}]
		dev-python/g2p-en[${PYTHON_USEDEP}]
		dev-python/jieba[${PYTHON_USEDEP}]
		dev-python/librosa[${PYTHON_USEDEP}]
		dev-python/pypinyin[${PYTHON_USEDEP}]
	')
"

BDEPEND="
	dev-python/setuptools
"

src_prepare() {
	# setup.py uses PKG_VER to set the package version when get_pypi_latest_version is unavailable
	export PKG_VER="${PV}"
	distutils-r1_src_prepare
}
