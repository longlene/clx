# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="772fcd787b6432b95facdf128b2ff35bf24e600c"

DESCRIPTION="A JOSE implementation"
HOMEPAGE="https://github.com/fukamachi/jose"
SRC_URI="https://github.com/fukamachi/jose/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/jonathan
	dev-lisp/trivial-utf8
	dev-lisp/alexandria
	dev-lisp/assoc-utils
	dev-lisp/ironclad
	dev-lisp/split-sequence
	dev-lisp/cl-base64
	test? ( dev-lisp/rove )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem "jose\/tests/,$d' jose.asd
		rm -r tests
	fi
}
