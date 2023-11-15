# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_11 )

inherit distutils-r1 pypi

DESCRIPTION="A next-generation Python notebook"
HOMEPAGE="https://marimo.io/"
SRC_URI="https://github.com/marimo-team/marimo/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/click-8.0[${PYTHON_USEDEP}]
	>=dev-python/importlib_resources-5.10.2[${PYTHON_USEDEP}]
	>=dev-python/jedi-0.18.0[${PYTHON_USEDEP}]
	>=dev-python/markdown-3.4[${PYTHON_USEDEP}]
	>=dev-python/pymdown-extensions-9.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.13[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.12.0[${PYTHON_USEDEP}]
	>=dev-python/tornado-6.1[${PYTHON_USEDEP}]
	>=dev-python/typing_extensions-4.4.0[${PYTHON_USEDEP}]
	dev-python/black[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/polars[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	default
	rm -rf examples
	distutils-r1_src_prepare
}
