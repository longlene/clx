# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2 eutils

DESCRIPTION="Common Lisp implementation PLANET form RESTAS application server"
HOMEPAGE="http://github.com/archimag/restas-planet"
SRC_URI="http://cloud.github.com/downloads/archimag/restas-planet/${P}.tar.bz2"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
nIUSE=""

RDEPEND="dev-lisp/net-telent-date
		 dev-lisp/local-time
		 dev-lisp/clon
		 >=dev-lisp/restas-0.0.4
		 >=dev-lisp/cl-closure-template-0.1.1
		 >=dev-lisp/cl-libxml2-0.3.2
		 dev-lisp/ironclad"

CLSYSTEMS="${PN}"

src_install() {
	common-lisp-install *.asd src resources
	common-lisp-symlink-asdf

	dodoc COPYING
}

