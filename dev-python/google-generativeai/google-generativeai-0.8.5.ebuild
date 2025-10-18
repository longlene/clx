# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="Google Generative AI High level API client library and tools"
HOMEPAGE="
	https://pypi.org/project/google-generativeai/
"
SRC_URI="https://files.pythonhosted.org/packages/6e/40/c42ff9ded9f09ec9392879a8e6538a00b2dc185e834a3392917626255419/google_generativeai-${PV}-py3-none-any.whl"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/google-ai-generativelanguage-0.6.15[${PYTHON_USEDEP}]
	dev-python/google-api-core[${PYTHON_USEDEP}]
	dev-python/google-api-python-client[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.15.0[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest




S="${WORKDIR}"

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" \
		"${DISTDIR}/${A}"
}

