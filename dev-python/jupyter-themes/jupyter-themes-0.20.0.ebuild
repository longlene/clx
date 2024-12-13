# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Custom Jupyter Notebook Themes"
HOMEPAGE="https://github.com/dunovank/jupyter-themes"
SRC_URI="https://github.com/dunovank/jupyter-themes/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/jupyter-core[${PYTHON_USEDEP}]
	>=dev-python/notebook-5.6.0[${PYTHON_USEDEP}]
	>=dev-python/ipython-5.4.1[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-1.4.3[${PYTHON_USEDEP}]
	>=dev-python/lesscpy-0.11.2[${PYTHON_USEDEP}]
"
