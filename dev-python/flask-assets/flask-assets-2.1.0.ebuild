# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1

DESCRIPTION="Asset management for Flask"
HOMEPAGE="http://github.com/miracle2k/flask-assets"
SRC_URI="https://github.com/miracle2k/flask-assets/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/flask-0.8[${PYTHON_USEDEP}]
	>=dev-python/webassets-0.11.1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/iniconfig-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/pluggy-1.3.0[${PYTHON_USEDEP}]
		>=dev-python/tomli-2.0.1[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
