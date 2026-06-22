# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PN="mlflow"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="The Open Source AI Engineering Platform for Agents, LLMs & Models"
HOMEPAGE="
	https://pypi.org/project/mlflow-skinny/
	https://mlflow.org/
	https://github.com/mlflow/mlflow
"
SRC_URI="https://github.com/mlflow/mlflow/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"/${MY_P}/libs/skinny
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/cachetools-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/click-7.0[${PYTHON_USEDEP}]
	dev-python/cloudpickle[${PYTHON_USEDEP}]
	>=dev-python/databricks-sdk-0.20.0[${PYTHON_USEDEP}]
	dev-python/fastapi[${PYTHON_USEDEP}]
	>=dev-python/gitpython-3.1.9[${PYTHON_USEDEP}]
	>=dev-python/importlib-metadata-3.7.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-proto-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-sdk-1.9.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.12.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-0.19.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.17.3[${PYTHON_USEDEP}]
	>=dev-python/sqlparse-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
	dev-python/uvicorn[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
