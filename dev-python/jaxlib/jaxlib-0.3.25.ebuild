# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_10 )
inherit python-r1

DESCRIPTION="XLA library for JAX"
HOMEPAGE="https://github.com/google/jax"
SRC_URI="https://files.pythonhosted.org/packages/e2/dd/aa2d28f48948a5f9b9257bd0690fe37ed7affe0782275844842c20883baa/${P}-cp310-cp310-manylinux2014_x86_64.whl -> ${P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE="cuda"
RDEPEND="
	dev-python/scipy[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.12[${PYTHON_USEDEP}]
	dev-python/absl-py[${PYTHON_USEDEP}]
	dev-python/flatbuffers[${PYTHON_USEDEP}]
"

S="${WORKDIR}"

src_install() {
	python_foreach_impl python_domodule ${PN}
}
