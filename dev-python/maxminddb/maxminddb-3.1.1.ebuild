# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Reader for the MaxMind DB format"
HOMEPAGE="https://github.com/maxmind/MaxMind-DB-Reader-python https://pypi.org/project/maxminddb/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

DEPEND="dev-libs/libmaxminddb:="
RDEPEND="${DEPEND}"

python_compile() {
	local -x MAXMINDDB_USE_SYSTEM_LIBMAXMINDDB=1
	distutils-r1_python_compile
}
