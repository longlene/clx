# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Python interface to Oracle"
HOMEPAGE="http://www.cxtools.net/default.aspx?nav=cxorlb"
SRC_URI="https://github.com/oracle/python-cx_Oracle/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-db/oracle-instantclient"
RDEPEND="${DEPEND}"


DOCS="README.md"

