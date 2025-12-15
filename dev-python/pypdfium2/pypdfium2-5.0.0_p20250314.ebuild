# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

EGIT_COMMIT="3731559b99a056f8957b4b62af92c7d18229c0be"

DESCRIPTION="Python bindings to PDFium"
HOMEPAGE="
	https://pypi.org/project/pypdfium2/
	https://github.com/pypdfium2-team/pypdfium2
"
SRC_URI="https://github.com/pypdfium2-team/pypdfium2/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( BSD-3 Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
BDEPEND="
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/ctypesgen[${PYTHON_USEDEP}]
"
#	test? (
#	)

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
