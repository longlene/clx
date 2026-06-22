# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Interactive plots and applications in the browser from Python"
HOMEPAGE="
	https://bokeh.org
	https://github.com/bokeh/bokeh
	https://pypi.org/project/bokeh/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/jinja2-2.9[${PYTHON_USEDEP}]
		>=dev-python/contourpy-1.2[${PYTHON_USEDEP}]
		>=dev-python/narwhals-1.13[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.16[${PYTHON_USEDEP}]
		>=dev-python/packaging-16.8[${PYTHON_USEDEP}]
		>=dev-python/pillow-7.1.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-3.10[${PYTHON_USEDEP}]
		>=dev-python/tornado-6.2[${PYTHON_USEDEP}]
		>=sci-geosciences/xyzservices-2021.9.1[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"

python_prepare_all() {
	sed -i \
		-e 's/^dynamic = \["version"\]$/version = "'"${PV}"'"/' \
		-e 's/, "setuptools-git-versioning"//' \
		-e 's/, "colorama"//' \
		pyproject.toml || die
	distutils-r1_python_prepare_all
}
