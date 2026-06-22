# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Asyncio-based library for sending notifications to users"
HOMEPAGE="https://github.com/phenobarbital/async-notify"
SRC_URI="https://github.com/phenobarbital/async-notify/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

# aiosmtplib and navconfig are not yet packaged in portage
RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/aiobotocore-2.15.2[${PYTHON_USEDEP}]
		>=dev-python/cloudpickle-3.1.0[${PYTHON_USEDEP}]
		dev-python/emoji[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1.4[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		>=dev-python/python-datamodel-0.3.12[${PYTHON_USEDEP}]
		>=dev-python/uvloop-0.20.0[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/cython-3.0.11[${PYTHON_USEDEP}]
	')
"
