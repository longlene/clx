# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fcb2b319ccc628e59a91e32e719a270017e3b270"

DESCRIPTION="A simple semaphore class for bordeaux-threads inspired by SBCL's semaphore"
HOMEPAGE="https://github.com/rmoritz/bt-semaphore"
SRC_URI="https://github.com/rmoritz/bt-semaphore/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
