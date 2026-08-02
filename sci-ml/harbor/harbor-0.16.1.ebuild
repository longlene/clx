# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Framework for evaluating and optimizing agents and models"
HOMEPAGE="https://github.com/harbor-framework/harbor"
SRC_URI="https://github.com/harbor-framework/harbor/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/litellm-1.83.14[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-4.4.1[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/pydantic-2.11.7[${PYTHON_USEDEP}]
		>=dev-python/shortuuid-1.0.13[${PYTHON_USEDEP}]
		>=dev-python/typer-0.16.0[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.4[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
		>=dev-python/rich-14.1.0[${PYTHON_USEDEP}]
		>=dev-python/toml-0.10.2[${PYTHON_USEDEP}]
		>=dev-python/tenacity-9.1.2[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-1.1.1[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1.6[${PYTHON_USEDEP}]
		>=dev-python/dirhash-0.5.0[${PYTHON_USEDEP}]
		>=dev-python/packaging-25.0[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.128.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.38.0[${PYTHON_USEDEP}]
		>=dev-python/pathspec-1.0.3[${PYTHON_USEDEP}]
		>=dev-python/supabase-2.28.2[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
		>=dev-python/filelock-3.29.4[${PYTHON_USEDEP}]
		>=dev-python/platformdirs-4.10.0[${PYTHON_USEDEP}]
	')
"
BDEPEND=""
