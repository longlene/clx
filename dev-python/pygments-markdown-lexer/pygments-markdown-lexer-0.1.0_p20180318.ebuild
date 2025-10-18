# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

EGIT_COMMIT="e651a9a3f664285b01451eb39232b1ad9af65956"

DESCRIPTION="A Markdown lexer for Pygments to highlight Markdown code snippets"
HOMEPAGE="
	https://pypi.org/project/pygments-markdown-lexer/
	https://github.com/jhermann/pygments-markdown-lexer
"
SRC_URI="https://github.com/jhermann/pygments-markdown-lexer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pygments-2.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
