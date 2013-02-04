# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit common-lisp-2 eutils

DESCRIPTION="Lexical-analyzer-generator package for Common Lisp"
HOMEPAGE="http://www.geocities.com/mparker762/clawk.html#lexer
		http://www.cl-user.net/asp/libs/tputils-lexer"
SRC_URI="http://common-lisp.net/~sionescu/files/${P}.tar.bz2"
LICENSE="BSD"

SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="!dev-lisp/cl-${PN}
		dev-lisp/regex"
