# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp client implementation of parts of RFC 2261"
HOMEPAGE="https://github.com/rwiker/trivial-ldap"
SRC_URI=""

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/usocket
	dev-lisp/cl-plus-ssl
	dev-lisp/cl-yacc
"
