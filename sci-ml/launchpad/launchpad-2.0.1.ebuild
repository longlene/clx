# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Small factory and abstract for defining actionable items"
HOMEPAGE="https://github.com/mikemalinowski/launchpad"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/factories[${PYTHON_USEDEP}]
	dev-python/qute[${PYTHON_USEDEP}]
	dev-python/scribble[${PYTHON_USEDEP}]
"
