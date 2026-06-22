# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Common data structures, types, classes and functions for Taipy"
HOMEPAGE="https://github.com/Avaiga/taipy https://pypi.org/project/taipy-common/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/deepdiff-6.7.0[${PYTHON_USEDEP}]
	>=dev-python/toml-0.10[${PYTHON_USEDEP}]
')"
