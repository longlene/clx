# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Subcommand REPL for click apps"
HOMEPAGE="https://github.com/click-contrib/click-repl"
SRC_URI="https://github.com/click-contrib/click-repl/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/click-7.0[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.36[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.7.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/tox-4.4.3[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
