# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Agent Framework / shim to use Pydantic with LLMs"
HOMEPAGE="
	https://ai.pydantic.dev/
	https://github.com/pydantic/pydantic-ai
	https://pypi.org/project/pydantic-ai/
"
SRC_URI="https://github.com/pydantic/pydantic-ai/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

src_prepare() {
	default
	sed -e '/only-include/{s#"/README.md"##}' \
		-e '/include/{s#"/README.md", ##}' \
		-i pyproject.toml 
	distutils-r1_src_prepare
}
