# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1 pypi

DESCRIPTION="A high performance erlang term encoder for Python"
HOMEPAGE="http://github.com/discord/erlpack"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/six-1.15[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-runner[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
