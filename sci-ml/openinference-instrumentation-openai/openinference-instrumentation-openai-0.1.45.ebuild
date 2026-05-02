# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="OpenInference OpenAI Instrumentation"
HOMEPAGE="
	https://pypi.org/project/openinference-instrumentation-openai/
	https://github.com/Arize-ai/openinference/
"
SRC_URI="https://github.com/Arize-ai/openinference/archive/refs/tags/python-${PN}-v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/opentelemetry-api[${PYTHON_USEDEP}]
	dev-python/opentelemetry-instrumentation[${PYTHON_USEDEP}]
	dev-python/opentelemetry-semantic-conventions[${PYTHON_USEDEP}]
	>=sci-ml/openinference-instrumentation-0.1.27[${PYTHON_USEDEP}]
	>=sci-ml/openinference-semantic-conventions-0.1.25[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/wrapt[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/openinference-python-${PN}-v${PV}/python/instrumentation/${PN}
