# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Ultra-lightweight text-to-speech model with just 15 million parameters"
HOMEPAGE="
	https://pypi.org/project/kittentts/
	https://github.com/KittenML/KittenTTS
"
SRC_URI="https://github.com/KittenML/KittenTTS/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/num2words[${PYTHON_USEDEP}]
		dev-python/spacy[${PYTHON_USEDEP}]
		dev-python/espeakng-loader[${PYTHON_USEDEP}]
		>=dev-python/misaki-0.9.4[${PYTHON_USEDEP}]
		sci-libs/onnxruntime[${PYTHON_USEDEP}]
		dev-python/soundfile[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/KittenTTS-${PV}
