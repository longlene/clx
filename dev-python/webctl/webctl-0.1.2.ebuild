# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Browser automation via CLI — for humans and agents"
HOMEPAGE="
	https://pypi.org/project/webctl/
	https://github.com/cosinusalpha/webctl
"
SRC_URI="https://github.com/cosinusalpha/webctl/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	|| (
		>=dev-python/playwright-bin-1.40.0[${PYTHON_USEDEP}]
		>=dev-python/playwright-1.40.0[${PYTHON_USEDEP}]
	)
	>=dev-python/typer-0.12.0[${PYTHON_USEDEP}]
	>=dev-python/rich-13.0.0[${PYTHON_USEDEP}]
	>=dev-python/lark-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-24.0.0[${PYTHON_USEDEP}]
	>=dev-python/markdownify-0.13.0[${PYTHON_USEDEP}]
	>=dev-python/deepdiff-7.0.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
