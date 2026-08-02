# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

MY_PV="${PV/_pre/.dev}"

inherit distutils-r1 pypi

DESCRIPTION="Open-source framework for foundation model research and development"
HOMEPAGE="https://marin.community https://github.com/marin-community/marin"
SRC_URI="$(pypi_sdist_url marin_core ${MY_PV})"
S="${WORKDIR}/marin_core-${MY_PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror test"

src_prepare() {
	# PyPI sdist does not include the top-level LICENSE (lives two dirs up in
	# the git repo). Replace the broken relative path with an inline text.
	sed -i 's|file = "../../LICENSE"|text = "Apache-2.0"|' pyproject.toml || die
	distutils-r1_src_prepare
}

RDEPEND="
	dev-python/braceexpand[${PYTHON_USEDEP}]
	dev-python/draccus[${PYTHON_USEDEP}]
	>=dev-libs/fastText-0.9.2[python,${PYTHON_USEDEP}]
	>=dev-python/fsspec-2025.3.0[${PYTHON_USEDEP}]
	dev-python/gcsfs[${PYTHON_USEDEP}]
	>=dev-python/google-api-python-client-2.175.0[${PYTHON_USEDEP}]
	dev-python/google-cloud-storage[${PYTHON_USEDEP}]
	>=dev-python/jax-0.9.2[${PYTHON_USEDEP}]
	dev-python/jaxopt[${PYTHON_USEDEP}]
	>=dev-python/markdownify-0.14.1[${PYTHON_USEDEP}]
	dev-python/mcp[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/openai[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.0[${PYTHON_USEDEP}]
	dev-python/plotly[${PYTHON_USEDEP}]
	>=dev-python/pyarrow-23.0.0[${PYTHON_USEDEP}]
	dev-python/regex[${PYTHON_USEDEP}]
	>=dev-python/requests-2.33.0[${PYTHON_USEDEP}]
	dev-python/resiliparse[${PYTHON_USEDEP}]
	>=dev-python/s3fs-2024[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/tqdm-loggable[${PYTHON_USEDEP}]
	>=dev-python/wandb-0.24.0[${PYTHON_USEDEP}]
	<sci-ml/datasets-5.0.0[${PYTHON_USEDEP}]
	sci-ml/marin-fray[${PYTHON_USEDEP}]
	sci-ml/marin-haliax[${PYTHON_USEDEP}]
	sci-ml/marin-iris[${PYTHON_USEDEP}]
	sci-ml/marin-levanter[${PYTHON_USEDEP}]
	sci-ml/marin-rigging[${PYTHON_USEDEP}]
	sci-ml/marin-zephyr[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/backports-zstd-1.0.0[${PYTHON_USEDEP}]
	' python3_13)
"
