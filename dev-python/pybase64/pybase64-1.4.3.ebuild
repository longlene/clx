# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

BASE64_COMMIT="9e8ed65048ff0f703fad3deb03bf66ac7f78a4d7"

DESCRIPTION="Fast Base64 encoding/decoding in Python"
HOMEPAGE="
	https://pypi.org/project/pybase64/
	https://github.com/mayeut/pybase64
"
SRC_URI="
	https://github.com/mayeut/pybase64/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/aklomp/base64/archive/${BASE64_COMMIT}.tar.gz -> base64-${BASE64_COMMIT}.tar.gz
"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	rmdir base64 && ln -sv "${WORKDIR}"/base64-${BASE64_COMMIT} base64
	distutils-r1_src_prepare
}
