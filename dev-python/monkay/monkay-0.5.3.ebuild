# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Lazy import, settings, and preload manager for Python"
HOMEPAGE="
	https://github.com/devkral/monkay
	https://pypi.org/project/monkay/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	test? (
		$(python_gen_cond_dep '
			dev-python/anyio[${PYTHON_USEDEP}]
			dev-python/pytest-timeout[${PYTHON_USEDEP}]
			dev-python/pydantic-settings[${PYTHON_USEDEP}]
		')
	)
"

EPYTEST_PLUGINS=()

distutils_enable_tests pytest
