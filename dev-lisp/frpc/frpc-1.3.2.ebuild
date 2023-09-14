# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3

DESCRIPTION="Common Lisp ONC-RPC implementation"
HOMEPAGE="https://github.com/fjames86/frpc"
SRC_URI="https://github.com/fjames86/frpc/archive/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/nibbles
	dev-lisp/flexi-streams
	dev-lisp/usocket
	dev-lisp/bordeaux-threads
	dev-lisp/pounds
	dev-lisp/babel
	dev-lisp/glass
	dev-lisp/ironclad
	dev-lisp/cerberus
	dev-lisp/cl-yacc
	dev-lisp/cl-lex
"

S="${WORKDIR}"/${PN}-${P}
