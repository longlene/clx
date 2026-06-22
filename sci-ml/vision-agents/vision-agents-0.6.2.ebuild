# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Build low latency voice and vision agents on any realtime edge network"
HOMEPAGE="https://github.com/GetStream/Vision-Agents https://visionagents.ai"
SRC_URI="https://github.com/getstream/vision-agents/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/Vision-Agents-${PV}/agents-core"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/aiortc[${PYTHON_USEDEP}]
		dev-python/av[${PYTHON_USEDEP}]
		dev-python/click[${PYTHON_USEDEP}]
		dev-python/colorlog[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.135.1[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1[${PYTHON_USEDEP}]
		dev-python/mcp[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.24.0[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.4.0[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-1.1.1[${PYTHON_USEDEP}]
		>=dev-python/urllib3-2.6.3[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.38.0[${PYTHON_USEDEP}]
		>=sci-libs/onnxruntime-1.16.1[python,${PYTHON_USEDEP}]
	')
"

python_prepare_all() {
	export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"
	distutils-r1_python_prepare_all
}
