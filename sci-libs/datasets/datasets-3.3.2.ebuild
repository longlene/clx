# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Access and share datasets for Audio, Computer Vision, and NLP tasks"
HOMEPAGE="
	https://pypi.org/project/datasets/
	https://github.com/huggingface/datasets/
"
SRC_URI="https://github.com/huggingface/${PN}/archive/refs/tags/${PV}.tar.gz
	-> ${P}.gh.tar.gz"
IUSE="test"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/filelock[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.17.0[${PYTHON_USEDEP}]
		>=dev-python/pyarrow-15.0.0[${PYTHON_USEDEP},parquet,snappy]
		>=dev-python/dill-0.3.0[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.2[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.66.3[${PYTHON_USEDEP}]
		dev-python/xxhash[${PYTHON_USEDEP}]
		>=dev-python/multiprocess-0.70.17[${PYTHON_USEDEP}]
		>=dev-python/fsspec-2023.1.0[${PYTHON_USEDEP}]
		dev-python/aiohttp[${PYTHON_USEDEP}]
		>=sci-libs/huggingface_hub-0.24.0[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.1.0[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"
BDEPEND="test? (
	$(python_gen_cond_dep '
		dev-python/absl-py[${PYTHON_USEDEP}]
		dev-python/pytest-datadir[${PYTHON_USEDEP}]
		dev-python/decorator[${PYTHON_USEDEP}]
		=dev-python/sqlalchemy-1*[${PYTHON_USEDEP}]
		sci-libs/jiwer[${PYTHON_USEDEP}]
		sci-libs/seqeval[${PYTHON_USEDEP}]
	')
)"

#PATCHES=( "${FILESDIR}"/${PN}-2.14.4-tests.patch )

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare
	rm tests/packaged_modules/test_spark.py || die
	rm tests/test_upstream_hub.py || die
	sed -i -e \
		"/pyarrow_hotfix/d" \
		src/datasets/features/features.py || die
}
