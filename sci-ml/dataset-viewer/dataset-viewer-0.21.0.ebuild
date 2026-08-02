# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Shared library powering the Hugging Face dataset viewer backend"
HOMEPAGE="
	https://huggingface.co/docs/dataset-viewer
	https://github.com/huggingface/dataset-viewer
"
SRC_URI="https://github.com/huggingface/dataset-viewer/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/dataset-viewer-${PV}/libs/libcommon"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/huggingface_hub-0.12.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/appdirs[${PYTHON_USEDEP}]
		>=dev-python/environs-9.5.0[${PYTHON_USEDEP}]
		dev-python/mongo-types[${PYTHON_USEDEP}]
		>=dev-python/mongoengine-0.24.1[${PYTHON_USEDEP}]
		>=dev-python/orjson-3.6.4[${PYTHON_USEDEP}]
		>=dev-python/psutil-5.9.2[${PYTHON_USEDEP}]
		>=dev-python/pymongo-3.13.0[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/poetry-core-1.0.0[${PYTHON_USEDEP}]
	')
"

src_prepare() {
	# Upstream pins python = "3.9.15"; relax to >=3.9 so modern Python works
	sed -i 's/^python = "3.9.15"/python = ">=3.9"/' pyproject.toml || die
	distutils-r1_src_prepare
}

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
