# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Access and share datasets for Audio, Computer Vision, and NLP tasks"
HOMEPAGE="
	https://pypi.org/project/datasets/
"
SRC_URI="https://github.com/huggingface/${PN}/archive/refs/tags/${PV}.tar.gz
	-> ${P}.gh.tar.gz"
IUSE="test"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# For pin on fsspec see https://github.com/huggingface/datasets/issues/6333
RDEPEND="
	${PYTHON_DEPS}
	sci-libs/pytorch[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/absl-py[${PYTHON_USEDEP}]
		dev-python/aiohttp[${PYTHON_USEDEP}]
		>=dev-python/fsspec-2023.10.0[${PYTHON_USEDEP}]
		dev-python/multiprocess[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pyarrow[${PYTHON_USEDEP},parquet,snappy]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/xxhash[${PYTHON_USEDEP}]
		dev-python/zstandard[${PYTHON_USEDEP}]
		>=sci-libs/huggingface_hub-0.14.0[${PYTHON_USEDEP}]
		dev-python/scikit-learn[${PYTHON_USEDEP}]
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
