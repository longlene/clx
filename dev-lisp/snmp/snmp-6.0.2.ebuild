# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="SNMP platform on Common Lisp"
HOMEPAGE="http://common-lisp.net/project/cl-net-snmp/"
SRC_URI="http://common-lisp.net/project/cl-net-snmp/release/snmp_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/usocket
dev-lisp/ironclad
dev-lisp/trivial-gray-streams"

