# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Comprehensive collection of 160+ tree-sitter language parsers"
HOMEPAGE="
	https://pypi.org/project/tree-sitter-language-pack/
"
SRC_URI="https://github.com/Goldziher/tree-sitter-language-pack/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="|| ( MIT Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/tree-sitter-0.25.2[${PYTHON_USEDEP}]
	>=dev-libs/tree-sitter-c-sharp-0.23.1
	>=dev-libs/tree-sitter-embedded-template-0.25.0
	>=dev-libs/tree-sitter-yaml-0.7.2[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/cython-3.0.12[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.15.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
