# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Python Client SDK for Unstructured API"
HOMEPAGE="
	https://pypi.org/project/unstructured-client/
	https://github.com/Unstructured-IO/unstructured-python-client
"
SRC_URI="https://github.com/Unstructured-IO/unstructured-python-client/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiofiles-24.1.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-3.1[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
	>=dev-python/nest-asyncio-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.11.2[${PYTHON_USEDEP}]
	>=dev-python/pypdf-4.0[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-1.0.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/unstructured-python-client-${PV}

src_prepare() {
	default
	sed -e 's#README-PYPI.md#README.md#' \
		-i pyproject.toml
	distutils-r1_src_prepare
}
