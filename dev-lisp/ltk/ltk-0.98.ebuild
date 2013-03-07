# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2 eutils

DESCRIPTION="LTK is a Common Lisp binding for the Tk graphics toolkit which does not require any Tk knowledge for its usage."
HOMEPAGE="http://www.peter-herth.de/ltk/"
SRC_URI="http://www.peter-herth.de/ltk/${P}.tgz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="!dev-lisp/cl-${PN}
		dev-lang/tk"

CLSYSTEMS="ltk ltk-mw ltk-remote"

src_install() {
	common-lisp-install *.{lisp,asd} remote.tcl
	common-lisp-symlink-asdf
	dodoc changenotes.txt troubleshooting.txt ltkdoc.pdf
}
