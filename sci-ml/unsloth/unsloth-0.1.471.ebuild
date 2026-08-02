# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13,14} )

inherit distutils-r1

DESCRIPTION="2-5X faster training, reinforcement learning and finetuning"
HOMEPAGE="
	https://unsloth.ai/
	https://github.com/unslothai/unsloth
"
SRC_URI="https://github.com/unslothai/unsloth/archive/refs/tags/v${PV}-beta.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${P}-beta"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="studio"

RDEPEND="
	sci-ml/unsloth-zoo[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchvision[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/typer[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/nest-asyncio[${PYTHON_USEDEP}]
		studio? (
			dev-python/fastapi[${PYTHON_USEDEP}]
			dev-python/uvicorn[${PYTHON_USEDEP}]
			dev-python/pyjwt[${PYTHON_USEDEP}]
			dev-python/easydict[${PYTHON_USEDEP}]
			dev-python/addict[${PYTHON_USEDEP}]
			dev-python/structlog[${PYTHON_USEDEP}]
			dev-python/matplotlib[${PYTHON_USEDEP}]
			dev-python/diceware[${PYTHON_USEDEP}]
			dev-python/sqlite-vec[${PYTHON_USEDEP}]
			dev-python/pymupdf[${PYTHON_USEDEP}]
			dev-python/python-docx[${PYTHON_USEDEP}]
		)
	')
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

pkg_postinst() {
	if use studio; then
		local studio_venv="${HOME}/.unsloth/studio/unsloth_studio/bin"
		if [[ ! -f "${studio_venv}/python" ]]; then
			mkdir -p "${studio_venv}"
			ln -sf /usr/bin/python3 "${studio_venv}/python"
			einfo "Created studio venv symlink: ${studio_venv}/python -> /usr/bin/python3"
		fi
	fi
}
