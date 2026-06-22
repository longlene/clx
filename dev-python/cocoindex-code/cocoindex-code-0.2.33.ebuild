# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Embedded code search engine CLI using AST-based indexing via CocoIndex"
HOMEPAGE="https://github.com/cocoindex-io/cocoindex-code"
SRC_URI="https://github.com/cocoindex-io/cocoindex-code/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

BDEPEND="$(python_gen_cond_dep '
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
')"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/cocoindex-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/einops-0.8.2[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/msgspec-0.19.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.24.0[${PYTHON_USEDEP}]
	>=dev-python/pathspec-0.12.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/questionary-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/sqlite-vec-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/typer-0.9.0[${PYTHON_USEDEP}]
')"

src_prepare() {
	# hatch-vcs falls back to "999.0.0" outside git; pin the release version
	sed -i "s/fallback-version = \"999.0.0\"/fallback-version = \"${PV}\"/" \
		pyproject.toml || die
	distutils-r1_src_prepare
}
