# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2fabb20ccc5ddfe60c91f5b500eb676bafbf4481"

DESCRIPTION="Max’s Parser Combinators"
HOMEPAGE="https://github.com/eugeneia/maxpc"
SRC_URI="https://github.com/eugeneia/maxpc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd test.lisp bench.lisp example-sexp.lisp
}
