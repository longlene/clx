# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

FAST_DOUBLE_PARSER_COMMIT="0f1fe9902d25847c8348e2f93ddc9dbe5521eab6"

DESCRIPTION="A JSON5 serializer and parser library for Python 3 written in Cython"
HOMEPAGE="
	https://pypi.org/project/pyjson5/
	https://github.com/Kijewski/pyjson5
"
SRC_URI="
	https://github.com/Kijewski/pyjson5/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/lemire/fast_double_parser/archive/${FAST_DOUBLE_PARSER_COMMIT}.tar.gz -> fast-double-parser-${FAST_DOUBLE_PARSER_COMMIT}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	default
	rmdir third-party/fast_double_parser && ln -sv "${WORKDIR}"/fast_double_parser-${FAST_DOUBLE_PARSER_COMMIT} third-party/fast_double_parser
	distutils-r1_src_prepare
}
