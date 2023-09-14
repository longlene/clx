# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="eXtensible Component Verifier and Builder for Common-Lisp"
HOMEPAGE="http://common-lisp.net/project/xcvb/"
SRC_URI="http://common-lisp.net/project/xcvb/releases/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
>=dev-lisp/asdf-2.016
dev-lisp/fare-mop
dev-lisp/fare-memoization
dev-lisp/uiop"

