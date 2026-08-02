# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="High-performance async Python ORM with Rust core"
HOMEPAGE="https://github.com/mr-fatalyst/oxyde https://pypi.org/project/oxyde/"
SRC_URI="https://github.com/mr-fatalyst/oxyde/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/${P}/python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
	>=dev-python/msgpack-1.0[${PYTHON_USEDEP}]
	>=dev-python/typer-0.24[${PYTHON_USEDEP}]
	>=dev-python/oxyde-core-0.6.2[${PYTHON_USEDEP}]
	<dev-python/oxyde-core-0.7.0[${PYTHON_USEDEP}]
"
