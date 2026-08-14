# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Unified execution environment for Python code, shell commands"
HOMEPAGE="https://github.com/gradion-ai/ipybox"
SRC_URI="https://github.com/gradion-ai/ipybox/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/ipykernel-7.1.0[${PYTHON_USEDEP}]
	>=dev-python/jupyter-kernel-gateway-3.0.1[${PYTHON_USEDEP}]
	>=dev-python/mcpygen-0.1.4[${PYTHON_USEDEP}]
	>=dev-python/psutil-7.1.3[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.2.1[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/uv-dynamic-versioning[${PYTHON_USEDEP}]
"

export UV_DYNAMIC_VERSIONING_BYPASS="${PV}"
