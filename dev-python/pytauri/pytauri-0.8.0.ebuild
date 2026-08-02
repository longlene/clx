# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="Tauri binding for Python through PyO3"
HOMEPAGE="https://github.com/pytauri/pytauri"
SRC_URI="https://github.com/pytauri/pytauri/archive/refs/tags/rs/tauri-plugin-pytauri/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/${P}/python/pytauri"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

RDEPEND="
	>=dev-python/pydantic-2[${PYTHON_USEDEP}]
	>=dev-python/anyio-4[${PYTHON_USEDEP}]
	>=dev-python/pillow-11.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.14[${PYTHON_USEDEP}]
	>=dev-python/importlib-metadata-8[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/hatchling-1.26[${PYTHON_USEDEP}]
"
