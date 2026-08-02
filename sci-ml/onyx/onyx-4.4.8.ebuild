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

# The backend group (kubernetes, discord.py, requests, python-dotenv, and
# ~80 more pinned deps) is not packaged here, most also unpackaged in
# portage. Install missing deps via pip.

src_prepare() {
	# Upstream hardcodes version = "0.0.0" in pyproject.toml; fix to actual release.
	sed -i 's/^version = "0\.0\.0"/version = "'"${PV}"'"/' pyproject.toml || die

	# Upstream dropped [build-system] and [tool.setuptools.packages.find]
	# since the project is no longer meant to be installed as a package
	# (docker images copy the source tree directly instead); re-add both
	# so setuptools can still build just the "onyx" backend package.
	cat >> pyproject.toml <<-EOF || die
		[build-system]
		requires = ["setuptools>=61"]
		build-backend = "setuptools.build_meta"

		[tool.setuptools.packages.find]
		where = ["backend"]
		include = ["onyx*"]
	EOF

	distutils-r1_src_prepare
}

RDEPEND="
	dev-python/agent-client-protocol[${PYTHON_USEDEP}]
	dev-python/aioboto3[${PYTHON_USEDEP}]
	app-arch/brotli[python,${PYTHON_USEDEP}]
	dev-python/cohere[${PYTHON_USEDEP}]
	dev-python/fastapi[${PYTHON_USEDEP}]
	dev-python/google-genai[${PYTHON_USEDEP}]
	dev-python/litellm
	dev-python/openai[${PYTHON_USEDEP}]
	dev-python/prometheus-client[${PYTHON_USEDEP}]
	dev-python/prometheus-fastapi-instrumentator[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/python-json-logger[${PYTHON_USEDEP}]
	dev-python/sentry-sdk[${PYTHON_USEDEP}]
	dev-python/tenacity[${PYTHON_USEDEP}]
	dev-python/uvicorn[${PYTHON_USEDEP}]
	dev-python/voyageai[${PYTHON_USEDEP}]
"
