# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_12 )

inherit distutils-r1

EGIT_COMMIT="3f9dd88d6f739b98a86aea608e238621f5b40add"

DESCRIPTION="An open-weight TTS model with 82 million parameters"
HOMEPAGE="
	https://pypi.org/project/kokoro/
	https://github.com/hexgrad/kokoro
"
SRC_URI="https://github.com/hexgrad/kokoro/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-libs/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-libs/transformers[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		sci-libs/huggingface_hub[${PYTHON_USEDEP}]
		dev-python/loguru[${PYTHON_USEDEP}]
		>=dev-python/misaki-0.8.4[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
