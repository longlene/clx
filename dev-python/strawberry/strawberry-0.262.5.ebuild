# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A GraphQL library for Python that leverages type annotations"
HOMEPAGE="
	https://strawberry.rocks/
	https://github.com/strawberry-graphql/strawberry
"
SRC_URI="https://github.com/strawberry-graphql/strawberry/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/graphql-core-3.4.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.5.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
