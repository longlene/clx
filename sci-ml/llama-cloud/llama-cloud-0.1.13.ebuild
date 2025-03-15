# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="LlamaIndex Python Client"
HOMEPAGE="
	https://pypi.org/project/llama-cloud/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pydantic-1.10[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.20.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2024.7.4[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
