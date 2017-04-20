# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8411137131a99e379c477cb830b4d58c3228f4d6"

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
