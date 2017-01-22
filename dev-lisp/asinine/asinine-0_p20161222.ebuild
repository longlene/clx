# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bb075565cc00906a36c1206d9e655ee270b1c379"

DESCRIPTION="Common Lisp ASN1 parser"
HOMEPAGE="https://github.com/fjames86/asinine"
SRC_URI="https://github.com/fjames86/asinine/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-lex
	dev-lisp/cl-yacc
	dev-lisp/flexi-streams
	dev-lisp/babel
	dev-lisp/nibbles
"

src_prepare() {
	use test || rm -rf ${PN}-test.asd test{,-choice,-encdec}.lisp
}
