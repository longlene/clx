# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

PATCHES=( "${FILESDIR}/omnigent-0.1.1-click82-compat.patch" )

DESCRIPTION="Declarative multi-agent authoring and runtime framework"
HOMEPAGE="https://github.com/omnigent-ai/omnigent"
SRC_URI="https://github.com/omnigent-ai/omnigent/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/omnigent-client[${PYTHON_USEDEP}]
	dev-python/omnigent-ui-sdk[${PYTHON_USEDEP}]
	>=dev-python/alembic-1.0[${PYTHON_USEDEP}]
	>=dev-python/anyio-4.0[${PYTHON_USEDEP}]
	>=dev-python/argon2-cffi-23.1[${PYTHON_USEDEP}]
	>=dev-python/cachetools-5.0[${PYTHON_USEDEP}]
	>=dev-python/cel-expr-python-0.1[${PYTHON_USEDEP}]
	>=dev-python/click-8.0[${PYTHON_USEDEP}]
	>=dev-python/claude-agent-sdk-0.1.62[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.100[${PYTHON_USEDEP}]
	>=dev-python/ftfy-6.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.27[${PYTHON_USEDEP}]
	>=dev-python/keyring-24[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.0[${PYTHON_USEDEP}]
	>=dev-python/openai-1.0[${PYTHON_USEDEP}]
	>=dev-python/openai-agents-0.0.17[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-exporter-otlp-proto-grpc-1.20[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-exporter-otlp-proto-http-1.20[${PYTHON_USEDEP}]
	dev-python/opentelemetry-instrumentation-fastapi[${PYTHON_USEDEP}]
	dev-python/opentelemetry-instrumentation-httpx[${PYTHON_USEDEP}]
	>=dev-python/packaging-23[${PYTHON_USEDEP}]
	>=dev-python/pexpect-4.9[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.9[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.8[${PYTHON_USEDEP}]
	>=dev-python/pyte-0.8[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/rich-13.0[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-2.0[${PYTHON_USEDEP}]
	>=dev-python/starlette-0.27[${PYTHON_USEDEP}]
	>=dev-python/tiktoken-0.7[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.12[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.30[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"

python_compile() {
	OMNIGENT_SKIP_WEB_UI=true distutils-r1_python_compile
}
