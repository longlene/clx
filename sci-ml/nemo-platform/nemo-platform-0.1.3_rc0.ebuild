# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PV="0.1.3-rc0"

DESCRIPTION="Make the agents you ship faster, more accurate, and safer"
HOMEPAGE="https://github.com/NVIDIA-NeMo/nemo-platform"
SRC_URI="https://github.com/NVIDIA-NeMo/nemo-platform/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/nemo-platform-${MY_PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/nmp-common[${PYTHON_SINGLE_USEDEP}]
	sci-ml/nmp-auth[${PYTHON_SINGLE_USEDEP}]
	sci-ml/nmp-secrets[${PYTHON_SINGLE_USEDEP}]
	sci-ml/nmp-models[${PYTHON_SINGLE_USEDEP}]
	sci-ml/nmp-entities[${PYTHON_SINGLE_USEDEP}]
	sci-ml/nmp-files[${PYTHON_SINGLE_USEDEP}]
	sci-ml/nmp-inference-gateway[${PYTHON_SINGLE_USEDEP}]
	sci-ml/nmp-jobs[${PYTHON_SINGLE_USEDEP}]
	sci-ml/nmp-platform-runner[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/base58-2.1.1[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.115.4[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.12.0[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1.4[${PYTHON_USEDEP}]
		>=dev-python/h11-0.16.0[${PYTHON_USEDEP}]
		>=dev-python/protobuf-6.33.5[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.10.6[${PYTHON_USEDEP}]
		dev-python/mypy-extensions[${PYTHON_USEDEP}]
		>=dev-python/tornado-6.5.5[${PYTHON_USEDEP}]
		>=dev-python/tomlkit-0.13.3[${PYTHON_USEDEP}]
		>=dev-python/hvac-2.3.0[${PYTHON_USEDEP}]
		>=dev-python/requests-2.33.1[${PYTHON_USEDEP}]
		>=dev-python/rich-14.1.0[${PYTHON_USEDEP}]
		>=dev-python/rich-argparse-1.7.2[${PYTHON_USEDEP}]
		>=dev-python/pyleak-0.1.0[${PYTHON_USEDEP}]
		dev-python/sacrebleu[${PYTHON_USEDEP}]
		sci-ml/nemo-platform-plugin[${PYTHON_USEDEP}]
	')
"
RESTRICT="test"
