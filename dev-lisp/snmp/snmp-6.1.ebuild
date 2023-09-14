# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="SNMP platform on Common Lisp"
HOMEPAGE="http://common-lisp.net/project/cl-net-snmp/"
SRC_URI="http://common-lisp.net/project/cl-net-snmp/release/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ironclad
	dev-lisp/ieee-floats
	dev-lisp/portable-threads
	>dev-lisp/usocket-0.6.4.1
	dev-lisp/trivial-gray-streams
"

src_prepare() {
	find . -name '\.*' -exec rm {} \;
	use test || rm -r ${PN}-test.asd test
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all mib.lisp-expr mibs compiled-mibs/*.lisp-expr
}
