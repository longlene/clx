# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="The agent that grows with you"
HOMEPAGE="
	https://pypi.org/project/hermes-agent/
	https://github.com/nousresearch/hermes-agent
	https://hermes-agent.nousresearch.com/
"
SRC_URI="
	https://github.com/NousResearch/hermes-agent/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/openai-2.24.0[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.2.2[${PYTHON_USEDEP}]
	>=dev-python/fire-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	dev-python/socksio[${PYTHON_USEDEP}]
	>=dev-python/rich-14.3.3[${PYTHON_USEDEP}]
	>=dev-python/tenacity-9.1.4[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.3[${PYTHON_USEDEP}]
	>=dev-python/ruamel-yaml-0.18.17[${PYTHON_USEDEP}]
	>=dev-python/requests-2.33.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.6[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.13.4[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.52[${PYTHON_USEDEP}]
	>=dev-python/croniter-6.0.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.13.0[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	>=dev-python/markdown-3.10.2[${PYTHON_USEDEP}]
	>=dev-python/urllib3-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-7.2.2[${PYTHON_USEDEP}]
	>=dev-python/websockets-15.0.1[${PYTHON_USEDEP}]
	>=dev-python/pathspec-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.104.0[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.24.0[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.9[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/ptyprocess[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

python_install() {
	distutils-r1_python_install

	# upstream data-files drops i18n catalogs at <prefix>/locales (FHS
	# violation); agent/i18n.py also probes <purelib>/locales, so relocate
	# into the impl's site-packages
	if [[ -d ${D}/usr/locales ]]; then
		python_domodule "${D}"/usr/locales
		rm -r "${D}"/usr/locales || die
	fi
}
