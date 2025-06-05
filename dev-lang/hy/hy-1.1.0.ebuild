# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A dialect of Lisp that's embedded in Python"
HOMEPAGE="
	https://hylang.org/
	https://pypi.org/project/hy/
	https://github.com/hylang/hy
"
SRC_URI="https://github.com/hylang/hy/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND+="
	>=dev-python/funcparserlib-1.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
