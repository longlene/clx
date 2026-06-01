# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Modular Python framework for LLM workflows, tools, memory, and data"
HOMEPAGE="https://www.griptape.ai https://github.com/griptape-ai/griptape https://pypi.org/project/griptape/"
SRC_URI="https://github.com/griptape-ai/griptape/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="anthropic aws image mongodb ollama pdf redis sql"
RESTRICT="test"

RDEPEND="
	>=dev-python/attrs-24.3.0[${PYTHON_USEDEP}]
	>=dev-python/filetype-1.2[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.4[${PYTHON_USEDEP}]
	>=dev-python/json-schema-to-pydantic-0.4.6[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-3.21.3[${PYTHON_USEDEP}]
	<dev-python/marshmallow-4[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-enum-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
	<dev-python/numpy-3[${PYTHON_USEDEP}]
	>=dev-python/openai-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/pip-25.0.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.7.4[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.0[${PYTHON_USEDEP}]
	>=dev-python/rich-13.7.1[${PYTHON_USEDEP}]
	>=dev-python/schema-0.7.7[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.5.0[${PYTHON_USEDEP}]
	>=dev-python/tiktoken-0.11[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.25.4[${PYTHON_USEDEP}]
	<dev-python/urllib3-3[${PYTHON_USEDEP}]
	>=dev-python/wrapt-1.16.0[${PYTHON_USEDEP}]
	anthropic? ( >=dev-python/anthropic-0.45.1[${PYTHON_USEDEP}] )
	aws? ( >=dev-python/boto3-1.34.119[${PYTHON_USEDEP}] )
	image? ( >=dev-python/pillow-11.0.0[${PYTHON_USEDEP}] )
	mongodb? ( >=dev-python/pymongo-4.8.0[${PYTHON_USEDEP}] )
	ollama? ( >=dev-python/ollama-0.4.1[${PYTHON_USEDEP}] )
	pdf? ( >=dev-python/pypdf-5.0.1[${PYTHON_USEDEP}] )
	redis? ( >=dev-python/redis-5.1.0[${PYTHON_USEDEP}] )
	sql? ( >=dev-python/sqlalchemy-2.0.31[${PYTHON_USEDEP}] )
"
