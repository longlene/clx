# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="A simple, easy-to-hack Vector Database"
HOMEPAGE="
	https://pypi.org/project/nano-vectordb/
	https://github.com/gusye1234/nano-vectordb
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	touch requirements.txt || die
	distutils-r1_src_prepare
}
