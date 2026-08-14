# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="General-purpose AI agent that acts via code actions"
HOMEPAGE="https://github.com/gradion-ai/freeact"
SRC_URI="https://github.com/gradion-ai/freeact/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiostream-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/google-genai-2.4.0[${PYTHON_USEDEP}]
	>=sci-ml/pydantic-ai-1.99.0[${PYTHON_USEDEP}]
	<sci-ml/pydantic-ai-2[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-12.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.3[${PYTHON_USEDEP}]
	>=dev-python/rich-14.2.0[${PYTHON_USEDEP}]
	>=dev-python/textual-8.0.0[${PYTHON_USEDEP}]
	>=dev-python/ipybox-0.9.1[${PYTHON_USEDEP}]
	>=dev-python/mcpygen-0.1.4[${PYTHON_USEDEP}]
	>=dev-python/trafilatura-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/tomli-w-1.2.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/uv-dynamic-versioning[${PYTHON_USEDEP}]
"

export UV_DYNAMIC_VERSIONING_BYPASS="${PV}"
