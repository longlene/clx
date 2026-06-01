# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..14}  )

inherit distutils-r1

DESCRIPTION="Parse Python docstrings in various flavors"
HOMEPAGE="
	https://github.com/rr-/docstring_parser
	https://pypi.org/project/docstring_parser/
"
SRC_URI="https://github.com/rr-/docstring_parser/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/docstring_parser-${PV}
KEYWORDS="~amd64"

BDEPEND="
	test? (
		>=dev-python/pydoctor-22.3.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
