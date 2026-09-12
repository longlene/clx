# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Minimalist Pi-style terminal coding-agent harness"
HOMEPAGE="
	https://github.com/huggingface/tau
	https://twotimespi.dev
"
SRC_URI="https://github.com/huggingface/tau/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/anyio-4.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.27[${PYTHON_USEDEP}]
	dev-python/socksio[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-11.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.11[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.18[${PYTHON_USEDEP}]
	>=dev-python/rich-13.0[${PYTHON_USEDEP}]
	>=dev-python/textual-8.2.8[${PYTHON_USEDEP}]
	>=dev-python/typer-0.12[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=( anyio )
distutils_enable_tests pytest
