# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1

DESCRIPTION="A python library to communicate with the Facebook Messenger API's"
HOMEPAGE="https://github.com/rehabstudio/fbmessenger"
SRC_URI="https://github.com/rehabstudio/fbmessenger/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/astroid-1.6.5[${PYTHON_USEDEP}]
	>=dev-python/atomicwrites-1.1.5[${PYTHON_USEDEP}]
	>=dev-python/attrs-18.1.0[${PYTHON_USEDEP}]
	>=dev-python/autopep8-1.3.5[${PYTHON_USEDEP}]
	>=dev-python/certifi-2018.4.16[${PYTHON_USEDEP}]
	=dev-python/chardet-3.0.4[${PYTHON_USEDEP}]
	=dev-python/coverage-4.5.1[${PYTHON_USEDEP}]
	=dev-python/flake8-3.5.0[${PYTHON_USEDEP}]
	=dev-python/funcsigs-1.0.2[${PYTHON_USEDEP}]
	=dev-python/idna-2.7[${PYTHON_USEDEP}]
	=dev-python/isort-4.3.4[${PYTHON_USEDEP}]
	=dev-python/lazy-object-proxy-1.3.1[${PYTHON_USEDEP}]
	=dev-python/mccabe-0.6.1[${PYTHON_USEDEP}]
	=dev-python/mock-2.0.0[${PYTHON_USEDEP}]
	=dev-python/more-itertools-4.2.0[${PYTHON_USEDEP}]
	=dev-python/pbr-3.1.1[${PYTHON_USEDEP}]
	=dev-python/pkginfo-1.4.2[${PYTHON_USEDEP}]
	=dev-python/pluggy-0.6.0[${PYTHON_USEDEP}]
	=dev-python/py-1.5.3[${PYTHON_USEDEP}]
	=dev-python/pyandoc-0.2.0[${PYTHON_USEDEP}]
	=dev-python/pycodestyle-2.4.0[${PYTHON_USEDEP}]
	=dev-python/pyflakes-1.6.0[${PYTHON_USEDEP}]
	=dev-python/pylint-1.9.2[${PYTHON_USEDEP}]
	=dev-python/pytest-3.6.2[${PYTHON_USEDEP}]
	=dev-python/pytest-cov-2.5.1[${PYTHON_USEDEP}]
	=dev-python/requests-2.19.1[${PYTHON_USEDEP}]
	=dev-python/requests-toolbelt-0.8.0[${PYTHON_USEDEP}]
	=dev-python/six-1.11.0[${PYTHON_USEDEP}]
	=dev-python/tqdm-4.23.4[${PYTHON_USEDEP}]
	=dev-python/twine-1.11.0[${PYTHON_USEDEP}]
	=dev-python/urllib3-1.23[${PYTHON_USEDEP}]
	=dev-python/wrapt-1.10.11[${PYTHON_USEDEP}]
"
BDEPEND=""

#distutils_enable_tests pytest
