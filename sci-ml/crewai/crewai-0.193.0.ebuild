# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Fast and Flexible Multi-Agent Automation Framework"
HOMEPAGE="
	https://pypi.org/project/crewai
	https://crewai.com
	https://github.com/crewAIInc/crewAI
"
SRC_URI="https://github.com/crewAIInc/crewAI/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-misc/litellm-1.74.9[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/tokenizers-0.20.3[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/pydantic-2.4.2[${PYTHON_USEDEP}]
		>=dev-python/openai-1.13.3[${PYTHON_USEDEP}]
		>=sci-ml/instructor-1.3.3[${PYTHON_USEDEP}]
		>=dev-python/pdfplumber-0.11.4[${PYTHON_USEDEP}]
		>=dev-python/regex-2024.9.11[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-api-1.30.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-sdk-1.30.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-exporter-otlp-proto-http-1.30.0[${PYTHON_USEDEP}]
		>=sci-ml/chromadb-0.5.23[${PYTHON_USEDEP}]
		sci-libs/onnxruntime[${PYTHON_USEDEP}]
		>=dev-python/openpyxl-3.1.5[${PYTHON_USEDEP}]
		>=dev-python/pyvis-0.3.2[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/pyjwt-2.9.0[${PYTHON_USEDEP}]
		>=dev-python/click-8.1.7[${PYTHON_USEDEP}]
		>=dev-python/appdirs-1.4.4[${PYTHON_USEDEP}]
		>=dev-python/jsonref-1.1.0[${PYTHON_USEDEP}]
		>=dev-python/json-repair-0.25.2[${PYTHON_USEDEP}]
		>=dev-python/uv-0.4.25[${PYTHON_USEDEP}]
		>=dev-python/tomli-w-1.1.0[${PYTHON_USEDEP}]
		>=dev-python/tomli-2.0.2[${PYTHON_USEDEP}]
		>=dev-python/blinker-1.9.0[${PYTHON_USEDEP}]
		>=dev-python/json5-0.10.0[${PYTHON_USEDEP}]
		>=dev-python/portalocker-2.7.0[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/crewAI-${PV}
