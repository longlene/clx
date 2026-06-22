# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PV="6.15.2"

DESCRIPTION="Python library for easily interacting with trained machine learning models"
HOMEPAGE="http://www.gradio.app/"
SRC_URI="https://github.com/gradio-app/gradio/archive/refs/tags/gradio@${MY_PV}.tar.gz -> gradio-${MY_PV}.gh.tar.gz"
S="${WORKDIR}"/gradio-gradio-${MY_PV}/client/python

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/huggingface_hub-0.19.3[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/fsspec[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.24.1[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.0[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/hatch-requirements-txt[${PYTHON_USEDEP}]
		>=dev-python/hatch-fancy-pypi-readme-22.5.0[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"
