# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="NVIDIA NeMo Agent Toolkit - AI agent orchestration framework"
HOMEPAGE="https://docs.nvidia.com/nemo/agent-toolkit/latest/ https://github.com/NVIDIA/NeMo-Agent-Toolkit"
SRC_URI="https://github.com/NVIDIA/NeMo-Agent-Toolkit/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

# Core sub-package is the installable unit; the repo root is a meta-package with packages = []
S="${WORKDIR}/NeMo-Agent-Toolkit-${PV}/packages/nvidia_nat_core"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
	>=dev-python/aiofiles-25.1[${PYTHON_USEDEP}]
	>=dev-python/authlib-1.7.2[${PYTHON_USEDEP}]
	<dev-python/authlib-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.1[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.4.6[${PYTHON_USEDEP}]
	>=dev-python/cryptography-46.0.6[${PYTHON_USEDEP}]
	>=dev-python/expandvars-1.0[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.119[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1[${PYTHON_USEDEP}]
	>=dev-python/jsonpath-ng-1.8[${PYTHON_USEDEP}]
	>=dev-python/nest-asyncio2-1.7[${PYTHON_USEDEP}]
	>=dev-python/networkx-3.4[${PYTHON_USEDEP}]
	sci-ml/nvidia-nat-atif[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.3[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.2[${PYTHON_USEDEP}]
	>=dev-python/pkce-1.0.3[${PYTHON_USEDEP}]
	>=dev-python/pkginfo-1.12[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4.3[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.11[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.11[${PYTHON_USEDEP}]
	>=dev-python/pymilvus-2.6.9[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.1.1[${PYTHON_USEDEP}]
	<dev-python/python-dotenv-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.21[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/rich-14.0[${PYTHON_USEDEP}]
	>=dev-python/starlette-0.51[${PYTHON_USEDEP}]
	<dev-python/starlette-2.0[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.9[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-5.3[${PYTHON_USEDEP}]
	>=dev-python/urllib3-2.6.3[${PYTHON_USEDEP}]
	<dev-python/urllib3-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.38[${PYTHON_USEDEP}]
')"

BDEPEND="
	>=dev-python/setuptools-scm-8
"

src_prepare() {
	# Set version for setuptools-scm — no git history available in portage sandbox
	export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_NVIDIA_NAT_CORE="${PV}"

	# Drop setuptools_dynamic_dependencies (not packaged) and inject static dep list.
	eapply "${FILESDIR}/${P}-no-dynamic-deps.patch"

	distutils-r1_src_prepare
}
