# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A CLI utility and Python library for interacting with Large Language Models"
HOMEPAGE="
	https://pypi.org/project/llm/
	https://github.com/simonw/llm
"
SRC_URI="https://github.com/simonw/llm/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/click[${PYTHON_USEDEP}]
	>=dev-python/condense-json-0.1.3[${PYTHON_USEDEP}]
	>=dev-python/openai-1.55.3[${PYTHON_USEDEP}]
	>=dev-python/click-default-group-1.2.3[${PYTHON_USEDEP}]
	>=dev-python/sqlite-utils-3.37[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/pluggy[${PYTHON_USEDEP}]
	dev-python/python-ulid[${PYTHON_USEDEP}]
	dev-python/puremagic[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
