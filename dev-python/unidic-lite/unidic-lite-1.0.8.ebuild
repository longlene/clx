# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

PYPI_PN=${PN}

inherit distutils-r1 pypi

DESCRIPTION="A small version of UniDic packaged for Python"
HOMEPAGE="
	https://pypi.org/project/unidic-lite/
	https://github.com/polm/unidic-lite
"
SRC_URI="$(pypi_sdist_url --no-normalize "${PN}" "${PV}")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

#distutils_enable_tests pytest
RESTRICT="test"

S="${WORKDIR}"/${P}
