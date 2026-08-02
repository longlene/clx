# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="AG-UI Protocol Python SDK"
HOMEPAGE="https://pypi.org/project/ag-ui-protocol/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pydantic[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/uv-build-0.8.0
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=( pytest )

distutils_enable_tests pytest
