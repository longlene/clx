# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Coding Agent for Mac"
HOMEPAGE="https://github.com/JosefAlbers/mlx-code"
SRC_URI="https://github.com/JosefAlbers/mlx-code/archive/529a1889803b59ff87b936787db1dc64a937f071.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/mlx-code-529a1889803b59ff87b936787db1dc64a937f071"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="extras"
RESTRICT="test"

src_prepare() {
	default
	rm -rf tests || die
}

RDEPEND="$(python_gen_cond_dep '
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/textual[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/starlette[${PYTHON_USEDEP}]
	dev-python/uvicorn[${PYTHON_USEDEP}]
	extras? (
		dev-python/python-lsp-server[${PYTHON_USEDEP}]
		dev-python/gitpython[${PYTHON_USEDEP}]
		dev-python/pygments[${PYTHON_USEDEP}]
	)
')"
