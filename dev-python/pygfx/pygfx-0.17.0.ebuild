# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )
DISTUTILS_USE_PEP517="flit"

inherit distutils-r1

DESCRIPTION="Powerful and versatile visualization for Python"
HOMEPAGE="https://pygfx.org https://github.com/pygfx/pygfx"
SRC_URI="https://github.com/pygfx/pygfx/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/freetype-py[${PYTHON_USEDEP}]
	dev-python/hsluv[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pylinalg[${PYTHON_USEDEP}]
	dev-python/rendercanvas[${PYTHON_USEDEP}]
	dev-python/uharfbuzz[${PYTHON_USEDEP}]
	dev-python/wgpu[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="${PYTHON_DEPS}
	test? (
		dev-python/gltflib[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/imageio[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/trimesh[${PYTHON_USEDEP}]
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
