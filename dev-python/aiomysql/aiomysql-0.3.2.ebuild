# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="MySQL driver for asyncio"
HOMEPAGE="https://github.com/aio-libs/aiomysql https://pypi.org/project/aiomysql/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/pymysql-1.0[${PYTHON_USEDEP}]
')"
BDEPEND="dev-python/setuptools-scm[${PYTHON_USEDEP}]"

python_prepare_all() {
	# Exclude examples/ and docs/ from auto-discovered packages to avoid
	# stray namespace packages landing in site-packages root
	local new_excludes='exclude = ["tests", "tests.*", "examples", "examples.*", "docs", "docs.*"]'
	sed -i -e "s|exclude = \[\"tests\", \"tests\.\*\"\]|${new_excludes}|" \
		pyproject.toml || die
	distutils-r1_python_prepare_all
}

python_compile() {
	SETUPTOOLS_SCM_PRETEND_VERSION="${PV}" distutils-r1_python_compile
}
