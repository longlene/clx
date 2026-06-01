# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )
PYTHON_REQ_USE="sqlite,tk?,xml(+)"

inherit distutils-r1

DESCRIPTION="Natural Language Toolkit"
HOMEPAGE="https://www.nltk.org/ https://github.com/nltk/nltk/"
SRC_URI="https://github.com/nltk/nltk/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 ~amd64-linux ~ppc-macos ~ppc64 ~riscv ~x64-macos ~x86-linux"
IUSE="tk"

RDEPEND="
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/joblib[${PYTHON_USEDEP}]
	>=dev-python/regex-2021.8.3[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/joblib[${PYTHON_USEDEP}]
		>=dev-python/nltk-data-20211221
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pyparsing[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/twython[${PYTHON_USEDEP}]
		dev-python/scikit-learn[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
	)"
PDEPEND="dev-python/nltk-data"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# Internet
	nltk/test/unit/test_downloader.py::test_downloader_using_existing_parent_download_dir
	nltk/test/unit/test_downloader.py::test_downloader_using_non_existing_parent_download_dir
)
