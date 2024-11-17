# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_12 )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
	https://pypi.org/project/rio-ui/
"
SRC_URI="https://github.com/rio-labs/rio/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/fastapi-0.110[${PYTHON_USEDEP}]
	>=dev-python/fuzzywuzzy-0.18[${PYTHON_USEDEP}]
	>=dev-python/gitignore_parser-0.1.11[${PYTHON_USEDEP}]
	>=dev-python/introspection-1.9.2[${PYTHON_USEDEP}]
	>=dev-python/isort-5.13[${PYTHON_USEDEP}]
	>=dev-python/keyring-24.3[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.2[${PYTHON_USEDEP}]
	>=dev-python/Levenshtein-0.23[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.6[${PYTHON_USEDEP}]
	>=dev-python/pytz-2024.1[${PYTHON_USEDEP}]
	>=dev-python/revel-0.9.1[${PYTHON_USEDEP}]
	>=dev-python/timer-dict-1.0[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.12[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.5[${PYTHON_USEDEP}]
	>=dev-python/unicall-0.1.5[${PYTHON_USEDEP}]
	>=dev-python/uniserde-0.3.14[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.29.0[${PYTHON_USEDEP}]
	>=dev-python/watchfiles-0.21[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.9[${PYTHON_USEDEP}]
	>=dev-python/langcodes-3.4.0[${PYTHON_USEDEP}]
	>=dev-python/crawlerdetect-0.1.7[${PYTHON_USEDEP}]
	>=dev-python/ordered-set-4.1.0[${PYTHON_USEDEP}]
	>=dev-python/imy-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/path-imports-1.1.2[${PYTHON_USEDEP}]
	>=dev-python/narwhals-1.12.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/rio-${PV}
