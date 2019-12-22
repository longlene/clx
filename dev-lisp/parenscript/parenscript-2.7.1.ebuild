# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Parenscript is a small lispy language that can be compiled to JavaScript."
HOMEPAGE="http://common-lisp.net/project/parenscript/"
SRC_URI="https://common-lisp.net/project/parenscript/release/${P}.tgz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="
	dev-lisp/anaphora
	dev-lisp/cl-ppcre
	dev-lisp/named-readtables
	test? ( dev-lisp/eos dev-lisp/cl-js )
"

S="${WORKDIR}/Parenscript-${PV}"

src_prepare() {
	default
	use test || rm -r ${PN}.tests.asd tests
}
	
