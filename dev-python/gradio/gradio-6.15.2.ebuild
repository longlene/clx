# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Build Machine Learning Web Apps — in Python"
HOMEPAGE="http://www.gradio.app/"
SRC_URI="https://github.com/gradio-app/gradio/archive/refs/tags/gradio@${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}"/gradio-${P}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/huggingface_hub-0.33.5[${PYTHON_SINGLE_USEDEP}]
	~dev-python/gradio-client-2.5.0[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/hf-gradio-0.4.1[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/anyio-3.0[${PYTHON_USEDEP}]
		app-arch/brotli[python,${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.115.2[${PYTHON_USEDEP}]
		dev-python/groovy[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.24.1[${PYTHON_USEDEP}]
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
		>=dev-python/pytz-2017.2[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.0[${PYTHON_USEDEP}]
		>=dev-python/safehttpx-0.1.7[${PYTHON_USEDEP}]
		>=dev-python/semantic-version-2.0[${PYTHON_USEDEP}]
		>=dev-python/starlette-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/tomlkit-0.12.0[${PYTHON_USEDEP}]
		>=dev-python/typer-0.12[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.14.0[${PYTHON_USEDEP}]
	')
	$(python_gen_cond_dep '
		dev-python/audioop-lts[${PYTHON_USEDEP}]
	' python3_13 python3_14)
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/hatch-requirements-txt[${PYTHON_USEDEP}]
		>=dev-python/hatch-fancy-pypi-readme-22.5.0[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"
