# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1

DESCRIPTION="Python bindings to PDFium"
HOMEPAGE="
	https://pypi.org/project/pypdfium2/
	https://github.com/pypdfium2-team/pypdfium2
"
SRC_URI="https://files.pythonhosted.org/packages/2f/74/92f508e71178aa85de32454762f84d6f9cef35c468caab3e0f1041dae464/pypdfium2-${PV}-py3-none-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"

LICENSE="|| ( BSD-3 Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
BDEPEND="
"
#	test? (
#	)

distutils_enable_tests pytest

S="${WORKDIR}"

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" \
		"${DISTDIR}/${A}"
}

