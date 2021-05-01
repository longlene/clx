# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="59e9aa5d0693aafd5012f350b9419a402c1b6f1e"

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
