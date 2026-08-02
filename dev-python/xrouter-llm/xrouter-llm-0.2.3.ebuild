# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Prompt-aware LLM router predicting which models can complete each request"
HOMEPAGE="https://github.com/xorbitsai/xrouter-llm"
SRC_URI="https://github.com/xorbitsai/xrouter-llm/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Xagent-Source-License"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

RDEPEND="
	>=dev-python/alembic-1.13[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.100[${PYTHON_USEDEP}]
	>=dev-python/joblib-1.3[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.24[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/scikit-learn-1.3[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.10[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-2.0[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.23[${PYTHON_USEDEP}]
	>=sci-ml/huggingface_hub-0.23
"

BDEPEND="
	>=dev-python/setuptools-scm-8[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"
