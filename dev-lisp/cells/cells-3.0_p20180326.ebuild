# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e8542b17fddd6340c1e237ce482a52327c8ead8e"

DESCRIPTION="A Common Lisp implementation of the dataflow programming paradigm"
HOMEPAGE="http://common-lisp.net/project/cells/
	http://www.tilton-technology.com/cells_top.html"
SRC_URI="https://github.com/kennytilton/cells/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/utils-kt
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test{,.asd}
}
	
