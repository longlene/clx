# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Create, edit, and run deterministic browser workflows (RPA 2.0)"
HOMEPAGE="https://github.com/browser-use/workflow-use"
SRC_URI="https://github.com/browser-use/workflow-use/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/workflow-use-${PV}/workflows"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/aiofiles-24.1.0[${PYTHON_USEDEP}]
	>=dev-python/browser-use-0.9.4[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.115.12[${PYTHON_USEDEP}]
	>=dev-python/fastmcp-2.3.4[${PYTHON_USEDEP}]
	>=dev-python/typer-0.15.3[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.34.2[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/markdownify-0.11.6[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.0[${PYTHON_USEDEP}]
	sci-ml/faiss[python,${PYTHON_USEDEP}]
"
