# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="SCM wrapper and fsspec filesystem for Git for use in DVC"
HOMEPAGE="
	https://github.com/iterative/scmrepo
	https://pypi.org/project/scmrepo/
"
SRC_URI="https://github.com/iterative/scmrepo/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/gitpython-3[${PYTHON_USEDEP}]
	>=dev-python/dulwich-0.22.1[${PYTHON_USEDEP}]
	>=dev-python/pygit2-1.14.0[${PYTHON_USEDEP}]
	>=dev-python/pygtrie-2.3.2[${PYTHON_USEDEP}]
	>=dev-python/fsspec-2024.2.0[${PYTHON_USEDEP}]
	>=dev-python/pathspec-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/asyncssh-2.13.1[${PYTHON_USEDEP}]
	>=dev-python/funcy-1.14[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-retry-2.5.0[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"
