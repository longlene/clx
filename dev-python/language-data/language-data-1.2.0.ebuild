# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
	https://pypi.org/project/language-data/
"
SRC_URI="https://github.com/georgkrause/language_data/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/marisa-trie-1.1.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/language_data-${PV}

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_LANGUAGE_DATA="${PV}"
