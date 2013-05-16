# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2 eutils

DESCRIPTION="Plugin for publish directories with RESTAS application server"
HOMEPAGE="http://github.com/archimag/restas-directory-publisher"
SRC_URI="http://archimag-lisp-overlay.googlecode.com/files/${P}.tar.bz2"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
nIUSE=""

RDEPEND=">=dev-lisp/restas-0.0.4
		 dev-lisp/hunchentoot-cgi
		 dev-lisp/cl-closure-template
		 dev-lisp/local-time
		 >=dev-lisp/iolib-0.7.0"

CLSYSTEMS="${PN}"

src_install() {
	common-lisp-install *.asd src
	common-lisp-symlink-asdf

	dodoc COPYING
	docinto example && dodoc example/*
}

