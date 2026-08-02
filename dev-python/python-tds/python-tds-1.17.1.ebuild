# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python DBAPI driver for MSSQL using pure Python TDS protocol"
HOMEPAGE="https://github.com/denisenkom/pytds"
SRC_URI="https://github.com/denisenkom/pytds/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/pytds-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

src_prepare() {
	echo "${PV}" > RELEASE-VERSION || die
	distutils-r1_src_prepare
}
