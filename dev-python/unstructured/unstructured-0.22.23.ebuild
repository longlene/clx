# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Open-Source Pre-Processing Tools for Unstructured Data"
HOMEPAGE="
	https://pypi.org/project/unstructured/
	https://github.com/Unstructured-IO/unstructured/
"
SRC_URI="https://github.com/Unstructured-IO/unstructured/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/beautifulsoup4-4.13.3[${PYTHON_USEDEP}]
	>=dev-python/charset-normalizer-3.4.4[${PYTHON_USEDEP}]
	>=dev-python/emoji-2.15.0[${PYTHON_USEDEP}]
	>=dev-python/filetype-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/html5lib-1.1[${PYTHON_USEDEP}]
	>=dev-python/langdetect-1.0.9[${PYTHON_USEDEP}]
	>=dev-python/lxml-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/spacy-3.7.0[${PYTHON_USEDEP}]
	>=dev-python/installer-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/numba-0.60.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.26.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-7.2.2[${PYTHON_USEDEP}]
	>=dev-python/python-iso639-2026.1.31[${PYTHON_USEDEP}]
	>=dev-python/python-magic-0.4.27[${PYTHON_USEDEP}]
	>=dev-python/python-oxmsg-0.0.2[${PYTHON_USEDEP}]
	>=dev-python/rapidfuzz-3.14.3[${PYTHON_USEDEP}]
	>=dev-python/regex-2024.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.5[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.67.3[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.15.0[${PYTHON_USEDEP}]
	>=dev-python/unstructured-client-0.25.9[${PYTHON_USEDEP}]
	>=dev-python/wrapt-2.1.1[${PYTHON_USEDEP}]
	>=dev-python/filelock-3.12.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
