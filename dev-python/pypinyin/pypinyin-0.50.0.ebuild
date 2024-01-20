# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1

DESCRIPTION="汉字拼音转换模块/工具"
HOMEPAGE="https://github.com/mozillazg/python-pinyin"
SRC_URI="https://github.com/mozillazg/python-pinyin/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND=""

RESTRICT=test

S="${WORKDIR}"/python-pinyin-${PV}
