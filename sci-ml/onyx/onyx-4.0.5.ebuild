# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Open Source AI Platform - AI Chat backed by any LLM"
HOMEPAGE="https://onyx.app https://github.com/onyx-dot-app/onyx"
SRC_URI="https://github.com/onyx-dot-app/onyx/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

# Many core deps (litellm, cohere, google-genai, kubernetes, brotli,
# voyageai, claude-agent-sdk, agent-client-protocol, retry) are not
# yet packaged in portage. The backend group adds ~80 more pinned deps,
# most also unpackaged. Install missing deps via pip.

src_prepare() {
	# Upstream hardcodes version = "0.0.0" in pyproject.toml; fix to actual release.
	sed -i 's/^version = "0\.0\.0"/version = "'"${PV}"'"/' pyproject.toml || die
	distutils-r1_src_prepare
}

python_install() {
	distutils-r1_python_install
	rm -r "${D}$(python_get_sitedir)/tests" || die
}

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/aioboto3[${PYTHON_USEDEP}]
		dev-python/discord-py[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/openai[${PYTHON_USEDEP}]
		dev-python/prometheus-client[${PYTHON_USEDEP}]
		dev-python/prometheus-fastapi-instrumentator[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/python-dotenv[${PYTHON_USEDEP}]
		dev-python/python-json-logger[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/sentry-sdk[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
	')
"
