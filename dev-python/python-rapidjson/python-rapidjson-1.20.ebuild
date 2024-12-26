# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

RAPIDJSON_COMMIT="ab1842a2dae061284c0a62dca1cc6d5e7e37e346"

DESCRIPTION="Python wrapper around rapidjson"
HOMEPAGE="
	https://pypi.org/project/python-rapidjson/
	https://github.com/python-rapidjson/python-rapidjson
"
SRC_URI="
	https://github.com/python-rapidjson/python-rapidjson/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/Tencent/rapidjson/archive/${RAPIDJSON_COMMIT}.tar.gz -> rapidjson-${RAPIDJSON_COMMIT}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"

src_prepare() {
	default
	rmdir rapidjson && ln -sv "${WORKDIR}"/rapidjson-${RAPIDJSON_COMMIT} rapidjson
	distutils-r1_src_prepare
}
