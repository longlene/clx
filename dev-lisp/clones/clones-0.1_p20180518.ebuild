# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a2f7d84ad6a12c0a33b50a453a377a1fb9e3afac"

DESCRIPTION="Common Lisp Observable Nintendo Entertainment System"
HOMEPAGE="https://github.com/kingcons/clones"
SRC_URI="https://github.com/kingcons/clones/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	test? ( dev-lisp/prove dev-lisp/split-sequence )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}
