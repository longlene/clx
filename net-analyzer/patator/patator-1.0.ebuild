
# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="A multi-purpose brute-forcer, with a modular design and a flexible usage"
HOMEPAGE="https://github.com/lanjelot/patator"
SRC_URI="https://github.com/lanjelot/patator/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/paramiko[${PYTHON_USEDEP}]
	dev-python/pycurl[${PYTHON_USEDEP}]
	dev-python/ajpy[${PYTHON_USEDEP}]
	dev-python/impacket[${PYTHON_USEDEP}]
	dev-python/pyopenssl[${PYTHON_USEDEP}]
	dev-python/cx-oracle[${PYTHON_USEDEP}]
	dev-python/mysqlclient[${PYTHON_USEDEP}]
	dev-python/psycopg:2[${PYTHON_USEDEP}]
	dev-python/pycryptodome[${PYTHON_USEDEP}]
	dev-python/dnspython[${PYTHON_USEDEP}]
	dev-python/ipy[${PYTHON_USEDEP}]
	>=dev-python/pysnmp-4.4.12[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-0.4.8[${PYTHON_USEDEP}]
	dev-python/pysqlcipher3[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
