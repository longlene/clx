# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Build Machine Learning Web Apps — in Python"
HOMEPAGE="http://www.gradio.app/"
SRC_URI="https://github.com/gradio-app/gradio/archive/refs/tags/gradio@${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/hatch-requirements-txt[${PYTHON_USEDEP}]
	>=dev-python/hatch-fancy-pypi-readme-22.5.0[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-22.0[${PYTHON_USEDEP}]
	>=dev-python/anyio-3.0[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.115.2[${PYTHON_USEDEP}]
	dev-python/ffmpy[${PYTHON_USEDEP}]
	>=dev-python/gradio-client-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.24.1[${PYTHON_USEDEP}]
	>=sci-ml/huggingface_hub-0.25.1[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	>=dev-python/markupsafe-2.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-8.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.18[${PYTHON_USEDEP}]
	dev-python/pydub[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.0[${PYTHON_USEDEP}]
	>=dev-python/semantic-version-2.0[${PYTHON_USEDEP}]
	>=dev-python/starlette-0.40.0[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.12.0[${PYTHON_USEDEP}]
	>=dev-python/typer-0.12[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.14.0[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"

S="${WORKDIR}"/gradio-${P}
