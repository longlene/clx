# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

EGIT_COMMIT="9a2c49b00852d012dc97850a3c0b3248f15bd043"

DESCRIPTION="A tool to grep through the AST of a source file"
HOMEPAGE="
	https://github.com/Aider-AI/grep-ast
	https://pypi.org/project/grep-ast/
"
SRC_URI="https://github.com/Aider-AI/grep-ast/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/tree-sitter-languages-1.8.0[${PYTHON_USEDEP}]
	dev-python/pathspec[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"
