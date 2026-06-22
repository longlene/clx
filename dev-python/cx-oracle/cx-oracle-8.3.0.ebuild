# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Python interface to Oracle"
HOMEPAGE="https://github.com/oracle/python-cx_Oracle"
SRC_URI="https://github.com/oracle/python-cx_Oracle/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-db/oracle-instantclient"
RDEPEND="${DEPEND}"

DOCS="README.md"
