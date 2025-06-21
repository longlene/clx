# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

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
	>=dev-python/anyio-4.9.0[${PYTHON_USEDEP}]
	>=dev-python/backoff-2.2.1[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-4.13.3[${PYTHON_USEDEP}]
	>=dev-python/certifi-2025.1.31[${PYTHON_USEDEP}]
	>=dev-python/cffi-1.17.1[${PYTHON_USEDEP}]
	>=dev-python/chardet-5.2.0[${PYTHON_USEDEP}]
	>=dev-python/charset-normalizer-3.4.1[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.8[${PYTHON_USEDEP}]
	>=dev-python/cryptography-44.0.2[${PYTHON_USEDEP}]
	>=dev-python/dataclasses-json-0.6.7[${PYTHON_USEDEP}]
	>=dev-python/deepdiff-8.4.2[${PYTHON_USEDEP}]
	>=dev-python/emoji-2.14.1[${PYTHON_USEDEP}]
	>=dev-python/exceptiongroup-1.2.2[${PYTHON_USEDEP}]
	>=dev-python/filetype-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/h11-0.14.0[${PYTHON_USEDEP}]
	>=dev-python/html5lib-1.1[${PYTHON_USEDEP}]
	>=dev-python/httpcore-1.0.7[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	>=dev-python/idna-3.10[${PYTHON_USEDEP}]
	>=dev-python/joblib-1.4.2[${PYTHON_USEDEP}]
	>=dev-python/jsonpath-1.0.6[${PYTHON_USEDEP}]
	>=dev-python/langdetect-1.0.9[${PYTHON_USEDEP}]
	>=dev-python/lxml-5.3.1[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-3.26.1[${PYTHON_USEDEP}]
	>=dev-python/mypy-extensions-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/nest-asyncio-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/nltk-3.9.1[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.0.2[${PYTHON_USEDEP}]
	>=dev-python/olefile-0.47[${PYTHON_USEDEP}]
	>=dev-python/orderly-set-5.3.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
	>=dev-python/psutil-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/pycparser-2.22[${PYTHON_USEDEP}]
	>=dev-python/pypdf-5.4.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/python-iso639-2025.2.18[${PYTHON_USEDEP}]
	>=dev-python/python-magic-0.4.27[${PYTHON_USEDEP}]
	>=dev-python/python-oxmsg-0.0.2[${PYTHON_USEDEP}]
	>=dev-python/rapidfuzz-3.12.2[${PYTHON_USEDEP}]
	>=dev-python/regex-2024.11.6[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.17.0[${PYTHON_USEDEP}]
	>=dev-python/sniffio-1.3.1[${PYTHON_USEDEP}]
	>=dev-python/soupsieve-2.6[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.67.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
	>=dev-python/typing-inspect-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/unstructured-client-0.25.9[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.20[${PYTHON_USEDEP}]
	>=dev-python/webencodings-0.5.1[${PYTHON_USEDEP}]
	>=dev-python/wrapt-1.17.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
