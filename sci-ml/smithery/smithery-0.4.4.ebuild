# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 pypi

DESCRIPTION="SDK for using Smithery with Python"
HOMEPAGE="
	https://pypi.org/project/smithery/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/toml-0.10.2[${PYTHON_USEDEP}]
	>=dev-python/typer-0.17.3[${PYTHON_USEDEP}] 
	>=dev-python/art-6.3[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.30.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/starlette-0.37.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

