# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Unified schema-based information extraction built on GLiNER"
HOMEPAGE="https://github.com/fastino-ai/GLiNER2"
SRC_URI="https://github.com/fastino-ai/GLiNER2/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/GLiNER2-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="local train"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/pydantic-2[${PYTHON_USEDEP}]
		>=dev-python/requests-2.28[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.64[${PYTHON_USEDEP}]
		>=dev-python/urllib3-1.26[${PYTHON_USEDEP}]
	')
	local? (
		>=sci-ml/pytorch-2.1
		>=sci-ml/transformers-4.38
		>=sci-ml/peft-0.10
		$(python_gen_cond_dep '
			>=dev-python/numpy-1.24[${PYTHON_USEDEP}]
			>=sci-ml/safetensors-0.4[${PYTHON_USEDEP}]
		')
	)
	train? (
		>=sci-ml/pytorch-2.1
		>=sci-ml/transformers-4.38
		>=sci-ml/peft-0.10
		$(python_gen_cond_dep '
			>=dev-python/numpy-1.24[${PYTHON_USEDEP}]
			>=sci-ml/safetensors-0.4[${PYTHON_USEDEP}]
			>=dev-python/pyyaml-6[${PYTHON_USEDEP}]
		')
	)
"
