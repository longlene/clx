# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="Mistral-common is a library of common utilities for Mistral AI"
HOMEPAGE="
	https://pypi.org/project/mistral-common
	https://github.com/mistralai/mistral-common
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pydantic-2.7[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.21.1[${PYTHON_USEDEP}]
	>=sci-ml/sentencepiece-0.2.0[python,${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.11.0[${PYTHON_USEDEP}]
	>=dev-python/tiktoken-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.3.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.25[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
