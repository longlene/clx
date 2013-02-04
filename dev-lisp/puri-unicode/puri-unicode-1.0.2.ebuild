# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit common-lisp-2

DESCRIPTION="Portable URI library for Common Lisp based on the Franz, Inc. :net.uri module."
HOMEPAGE="http://github.com/archimag/puri-unicode"
SRC_URI="http://github.com/downloads/archimag/puri-unicode/${P}.tar.bz2"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="!dev-lisp/cl-puri
		!dev-lisp/puri
		dev-lisp/ptester
		dev-lisp/babel"

CLSYSTEMS="puri"

src_install() {
	common-lisp-install *.{lisp,asd}
	common-lisp-symlink-asdf
	dohtml uri.html
	dodoc README
}
