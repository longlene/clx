# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="UniDic packaged for Python"
HOMEPAGE="
	https://pypi.org/project/unidic/
"
SRC_URI="
	https://github.com/polm/unidic-py/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://cotonoha-dic.s3-ap-northeast-1.amazonaws.com/unidic-3.1.0.zip
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

distutils_enable_tests pytest

src_prepare() {
	default
	rm unidic/{__main__,download}.py
	rm -rf unidic/dicdir && mv "${WORKDIR}"/unidic unidic/dicdir
	echo "unidic-3.1.0+2021-08-31" > unidic/version
	distutils-r1_src_prepare
}
