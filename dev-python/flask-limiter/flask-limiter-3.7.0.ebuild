# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Rate Limiting extension for Flask"
HOMEPAGE="https://github.com/alisaifee/flask-limiter"
SRC_URI="https://github.com/alisaifee/flask-limiter/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/flask-2[${PYTHON_USEDEP}]
	>=dev-python/limits-2.8[${PYTHON_USEDEP}]
	>=dev-python/ordered-set-4[${PYTHON_USEDEP}]
	>=dev-python/rich-12[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"
