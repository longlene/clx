# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7d61525e6132857e79a53fca233f832d4a6812cb"

DESCRIPTION="Collections of accessor functions and patterns to access the elements in a compound type specifier"
HOMEPAGE="https://github.com/guicho271828/type-r"
SRC_URI="https://github.com/guicho271828/type-r/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivia
	dev-lisp/alexandria
	test? ( dev-lisp/type-r )
"

src_prepare() {
	default
	use test || rm -r ${PN}.test.asd t
}
