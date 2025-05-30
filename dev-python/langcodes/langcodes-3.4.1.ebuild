# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A Python library for working with and comparing language codes"
HOMEPAGE="https://github.com/georgkrause/langcodes"
SRC_URI="https://github.com/georgkrause/langcodes/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/language-data-1.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-cv[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_LANGCODES="${PV}"

