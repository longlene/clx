# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="Interactive Redis"
HOMEPAGE="
	https://iredis.xbin.io/
	https://github.com/laixintao/iredis
"
SRC_URI="https://github.com/laixintao/iredis/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/prompt_toolkit-3[${PYTHON_USEDEP}]
	>=dev-python/pygments-2[${PYTHON_USEDEP}]
	>=dev-python/mistune-3.0[${PYTHON_USEDEP}]
	>=dev-python/configobj-5.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.0[${PYTHON_USEDEP}]
	>=dev-python/pendulum-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/wcwidth-0.1.9[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.0[${PYTHON_USEDEP}]
	>=dev-python/redis-5.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-7.2[${PYTHON_USEDEP}]
		>=dev-python/pexpect-4.7[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
