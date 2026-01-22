# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="High-quality multi-lingual text-to-speech library by MyShell.ai"
HOMEPAGE="
	https://github.com/myshell-ai/MeloTTS
"
SRC_URI="https://github.com/myshell-ai/MeloTTS/archive/refs/tags/v0.1.2.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-libs/torchaudio[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/transformers-4.27.4[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/tensorboard-2.16.2[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/txtsplit[${PYTHON_USEDEP}]
		dev-python/cached-path[${PYTHON_USEDEP}]
		>=dev-python/num2words-0.5.12[${PYTHON_USEDEP}]
		>=dev-python/unidic-lite-1.0.8[${PYTHON_USEDEP}]
		>=dev-python/unidic-py-1.1.0[${PYTHON_USEDEP}]
		>=dev-python/mecab-python-1.0.9:3[${PYTHON_USEDEP}]
		>=dev-python/pykakasi-2.2.1[${PYTHON_USEDEP}]
		>=dev-python/fugashi-1.3.0[${PYTHON_USEDEP}]
		>=dev-python/g2p_en-2.1.0[${PYTHON_USEDEP}]
		>=dev-python/anyascii-0.3.2[${PYTHON_USEDEP}]
		>=dev-python/jamo-0.4.1[${PYTHON_USEDEP}]
		>=dev-python/gruut-2.2.3[${PYTHON_USEDEP}]
		>=dev-python/g2pkk-0.1.1[${PYTHON_USEDEP}]
		>=dev-python/librosa-0.9.1[${PYTHON_USEDEP}]
		>=dev-python/pydub-0.25.1[${PYTHON_USEDEP}]
		>=dev-python/eng-to-ipa-0.0.2[${PYTHON_USEDEP}]
		>=dev-python/inflect-7.0.0[${PYTHON_USEDEP}]
		>=dev-python/unidecode-1.3.7[${PYTHON_USEDEP}]
		>=dev-python/pypinyin-0.50.0[${PYTHON_USEDEP}]
		>=dev-python/cn2an-0.5.22[${PYTHON_USEDEP}]
		>=dev-python/jieba-0.42.1[${PYTHON_USEDEP}]
		dev-python/gradio[${PYTHON_USEDEP}]
		>=dev-python/langid-1.1.6[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		>=dev-python/loguru-0.7.2[${PYTHON_USEDEP}]
	')
"
BDEPEND=""

S="${WORKDIR}"/MeloTTS-${PV}
