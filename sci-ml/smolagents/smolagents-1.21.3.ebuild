# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="A smol library to build great agents"
HOMEPAGE="
	https://pypi.org/project/smolagents/
	https://github.com/huggingface/smolagents/
"
SRC_URI="https://github.com/huggingface/smolagents/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/huggingface_hub-0.28.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=dev-python/rich-13.9.4[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.4[${PYTHON_USEDEP}]
	>=dev-python/pillow-11.0.0[${PYTHON_USEDEP}]
	>=dev-python/markdownify-0.14.1[${PYTHON_USEDEP}]
	>=dev-python/duckduckgo_search-6.3.7[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-datadir[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
