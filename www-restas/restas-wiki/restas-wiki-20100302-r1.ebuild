# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2 eutils

DESCRIPTION="Wiki engine plugin for RESTAS application server"
HOMEPAGE="http://github.com/archimag/restas-wiki"
SRC_URI="http://cloud.github.com/downloads/archimag/restas-wiki/${P}.tar.bz2"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND=">=dev-lisp/restas-0.0.4
		 >=dev-lisp/cl-libxml2-0.3.2
		 >=dev-lisp/wiki-parser-0.1.1
		 dev-lisp/cl-closure-template
		 dev-lisp/colorize
		 dev-lisp/local-time
		 dev-lisp/zip
		 >=dev-lisp/cl-pdf-20091211
		 dev-lisp/cl-typesetting"

CLSYSTEMS="${PN}"

src_install() {
	common-lisp-install *.asd src resource fonts
	common-lisp-symlink-asdf

	dodoc COPYING
}

