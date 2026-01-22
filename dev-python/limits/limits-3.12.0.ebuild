# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="Rate limiting using various strategies and storage backends"
HOMEPAGE="https://github.com/alisaifee/limits"
SRC_URI="https://github.com/alisaifee/limits/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/deprecated-1.2[${PYTHON_USEDEP}]
	>=dev-python/importlib-resources-1.3[${PYTHON_USEDEP}]
	>=dev-python/packaging-21[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/hiro-0.1.6[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
