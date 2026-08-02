# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Dataclass-based configuration framework based on Pyrallis"
HOMEPAGE="https://github.com/dlwh/draccus https://pypi.org/project/draccus/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

src_prepare() {
	rm -rf draccus.egg-info || die
	sed -i \
		's/exclude = \["cache"\]/exclude = ["cache", "tests", "tests.*", "examples", "examples.*"]/' \
		pyproject.toml || die
	distutils-r1_src_prepare
}

RDEPEND="
	dev-python/mergedeep[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/toml[${PYTHON_USEDEP}]
	dev-python/typing-inspect[${PYTHON_USEDEP}]
"
