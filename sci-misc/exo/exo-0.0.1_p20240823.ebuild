# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

EGIT_COMMIT="6243846eeb89811545e7199adab2223523ba2744"

DESCRIPTION="Run your own AI cluster at home with everyday devices"
HOMEPAGE="https://github.com/exo-explore/exo"
SRC_URI="https://github.com/exo-explore/exo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
  	>=dev-python/aiohttp-3.10.2[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-24.1.0[${PYTHON_USEDEP}]
	>=dev-python/blobfile-2.1.1[${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.64.1[${PYTHON_USEDEP}]
	>=dev-python/grpcio-tools-1.64.1[${PYTHON_USEDEP}]
	>=dev-python/hf-transfer-0.1.8[${PYTHON_USEDEP}]
	>=dev-python/huggingface-hub-0.24.5[${PYTHON_USEDEP}]
	>=dev-python/Jinja2-3.1.4[${PYTHON_USEDEP}]
	>=dev-python/netifaces-0.11.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.4.0[${PYTHON_USEDEP}]
	>=dev-python/prometheus-client-0.20.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-5.27.1[${PYTHON_USEDEP}]
	>=dev-python/psutil-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/pynvml-11.5.3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=dev-python/rich-13.7.1[${PYTHON_USEDEP}]
	>=dev-python/safetensors-0.4.3[${PYTHON_USEDEP}]
	>=dev-python/tenacity-9.0.0[${PYTHON_USEDEP}]
	>=dev-python/tiktoken-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/tokenizers-0.19.1[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.66.4[${PYTHON_USEDEP}]
	>=dev-python/transformers-4.43.3[${PYTHON_USEDEP}]
	>=dev-python/uuid-1.30[${PYTHON_USEDEP}]
	dev-python/tinygrad[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest

RESTRICT="test"

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_prepare() {
	default
	mv main.py exo-py
	sed -e '/extras_require=extras_require,/a scripts=["exo-py"]' \
		-i setup.py
}

