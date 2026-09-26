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
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/openai-2.24.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2026.5.20[${PYTHON_USEDEP}]
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
	>=dev-python/firecrawl-anydoc-0.2.4[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.13.4[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.52[${PYTHON_USEDEP}]
	>=dev-python/croniter-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/snowballstemmer-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/packaging-26.0[${PYTHON_USEDEP}]
	>=dev-python/markdown-3.10.2[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.13.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-50.0.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-7.2.2[${PYTHON_USEDEP}]
	>=dev-python/websockets-15.0.1[${PYTHON_USEDEP}]
	>=dev-python/pathspec-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.104.0[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.31.0[${PYTHON_USEDEP}]
	>=dev-python/httptools-0.6.3[${PYTHON_USEDEP}]
	>=dev-python/watchfiles-0.20[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.9[${PYTHON_USEDEP}]
	>=dev-python/ptyprocess-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-12.3.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-heif-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/nemo-relay-0.8.3[${PYTHON_USEDEP}]
	<dev-python/nemo-relay-0.9[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

python_compile() {
	# setup.py refuses to build a wheel outside upstream's Nix build; like
	# Nix, ship the data dirs separately and point hermes at them (env.d)
	local -x HERMES_NIX_BUILD=1
	distutils-r1_python_compile
}

python_install_all() {
	distutils-r1_python_install_all

	insinto /usr/share/${PN}
	doins -r skills optional-skills plugins locales optional-mcps

	# the web UI (web_dist) and TUI are separate npm builds and not shipped
	newenvd - 50${PN} <<-EOF
		HERMES_BUNDLED_SKILLS="${EPREFIX}/usr/share/${PN}/skills"
		HERMES_OPTIONAL_SKILLS="${EPREFIX}/usr/share/${PN}/optional-skills"
		HERMES_BUNDLED_PLUGINS="${EPREFIX}/usr/share/${PN}/plugins"
		HERMES_BUNDLED_LOCALES="${EPREFIX}/usr/share/${PN}/locales"
		HERMES_OPTIONAL_MCPS="${EPREFIX}/usr/share/${PN}/optional-mcps"
	EOF
}
