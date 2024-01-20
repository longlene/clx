# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1 pypi

DESCRIPTION="Build Machine Learning Web Apps — in Python"
HOMEPAGE="http://www.gradio.app/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiofiles-22.0[${PYTHON_USEDEP}]
	>=dev-python/altair-4.2.0[${PYTHON_USEDEP}]
	dev-python/fastapi[${PYTHON_USEDEP}]
	dev-python/ffmpy[${PYTHON_USEDEP}]
	>=dev-python/gradio_client-0.8.0[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	>=dev-python/huggingface_hub-0.19.3[${PYTHON_USEDEP}]
	>=dev-python/importlib_resources-1.3[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	>=dev-python/markupsafe-2.0[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-8.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
	dev-python/python-multipart[${PYTHON_USEDEP}]
	dev-python/pydub[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.0[${PYTHON_USEDEP}]
	>=dev-python/semantc_version-2.0[${PYTHON_USEDEP}]
	>=dev-python/typing_extensions-4.0[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.14.0[${PYTHON_USEDEP}]
	>=dev-python/typer-0.9[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.12.0[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"
