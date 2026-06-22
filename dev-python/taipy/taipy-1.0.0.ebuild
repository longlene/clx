# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="360° open-source platform from Python pilots to production-ready web apps"
HOMEPAGE="https://www.taipy.io https://github.com/Avaiga/taipy"
SRC_URI="https://github.com/Avaiga/taipy/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="arrow image mssql ngrok rdp"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/taipy-gui-1.0[${PYTHON_USEDEP}]
		>=dev-python/taipy-rest-1.0[${PYTHON_USEDEP}]
		arrow? ( dev-python/pyarrow[${PYTHON_USEDEP}] )
		image? ( dev-python/python-magic[${PYTHON_USEDEP}] )
		mssql? ( dev-python/pyodbc[${PYTHON_USEDEP}] )
		ngrok? ( dev-python/pyngrok[${PYTHON_USEDEP}] )
		rdp? ( dev-python/rdp[${PYTHON_USEDEP}] )
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/setuptools[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"
