# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="A natural language interface for computers"
HOMEPAGE="
	http://openinterpreter.com/
	https://github.com/OpenInterpreter/open-interpreter
	https://pypi.org/project/html2image/
"
SRC_URI="https://github.com/OpenInterpreter/open-interpreter/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/astor-0.8.1[${PYTHON_USEDEP}]
	>=dev-python/git-python-1.0.3[${PYTHON_USEDEP}]
	>=dev-python/inquirer-3.1.3[${PYTHON_USEDEP}]
	>=dev-python/litellm-1.35.32[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}]
	>=dev-python/rich-13.4.2[${PYTHON_USEDEP}]
	>=dev-python/six-1.16.0[${PYTHON_USEDEP}]
	>=dev-python/tokentrim-0.1.13[${PYTHON_USEDEP}]
	>=dev-python/wget-3.2[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.9.6[${PYTHON_USEDEP}]
	>=dev-python/html2image-2.0.4.3[${PYTHON_USEDEP}]
	>=dev-python/send2trash-1.8.2[${PYTHON_USEDEP}]
	>=dev-python/ipykernel-6.26.0[${PYTHON_USEDEP}]
	>=dev-python/jupyter-client-8.6.0[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.8.2[${PYTHON_USEDEP}]
	>=dev-python/toml-0.10.2[${PYTHON_USEDEP}]
	>=dev-python/tiktoken-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4.2.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.6.4[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/black-23.10.1[${PYTHON_USEDEP}]
		>=dev-python/isort-5.12.0[${PYTHON_USEDEP}]
		>=dev-python/sniffio-1.3.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
