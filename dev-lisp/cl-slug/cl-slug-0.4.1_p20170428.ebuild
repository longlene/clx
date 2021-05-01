# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e7414913501f3e1e008f0c3591bad7d8f7a82bb6"

DESCRIPTION="Small library to make slugs, mainly for URIs, from english and beyond"
HOMEPAGE="https://github.com/EuAndreh/cl-slug"
SRC_URI="https://github.com/EuAndreh/cl-slug/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}
