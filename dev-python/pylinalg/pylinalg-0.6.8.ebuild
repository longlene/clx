# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )
DISTUTILS_USE_PEP517="flit"

inherit distutils-r1

DESCRIPTION="Linear algebra utilities for Python"
HOMEPAGE="https://github.com/pygfx/pylinalg"
SRC_URI="https://github.com/pygfx/pylinalg/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="${PYTHON_DEPS}
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

# gpep517 install-wheel leaves a venv-like layout in the install root;
# the eclass hook dies if the script dir already exists.
python_compile() {
	distutils-r1_python_compile
	rm -f "${BUILD_DIR}/install"/usr/bin/python* "${BUILD_DIR}/install"/pyvenv.cfg || die
	rm -rf "${BUILD_DIR}/install$(python_get_scriptdir)" || die
}
