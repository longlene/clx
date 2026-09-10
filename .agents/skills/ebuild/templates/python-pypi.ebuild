# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Choose one: hatchling | setuptools | pdm-backend | flit | poetry | meson-python | uv-build
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

# Include "pypi" if the package is on PyPI with a standard name/layout
inherit distutils-r1 pypi

DESCRIPTION=""
# If PyPI name differs from PN (e.g. uses underscores), set before inherit:
# PYPI_PN="${PN/-/_}"

HOMEPAGE="
	https://github.com/OWNER/REPO/
	https://pypi.org/project/PYPI-NAME/
"

# pypi eclass auto-sets SRC_URI and S. Only override if needed:
# SRC_URI="$(pypi_sdist_url "${PYPI_PN^}" "${PV}")"
# S="${WORKDIR}/${PYPI_PN^}-${PV}"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

# Optional features:
# IUSE="doc"

RDEPEND="
	dev-python/some-runtime-dep[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

# Enables pytest; auto-sets RESTRICT="!test? ( test )" and adds pytest to BDEPEND
distutils_enable_tests pytest

# Override only if needed:
# python_test() {
# 	local EPYTEST_DESELECT=(
# 		tests/test_broken.py::TestCase::test_method
# 	)
# 	epytest
# }
