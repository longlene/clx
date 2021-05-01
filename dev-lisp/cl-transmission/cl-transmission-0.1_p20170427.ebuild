# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8a1d449dc457b6eb1ca262cee91305bf48eb8e41"

DESCRIPTION="A Common Lisp library to interface with transmission using its rpc"
HOMEPAGE="https://github.com/libre-man/cl-transmission"
SRC_URI="https://github.com/libre-man/cl-transmission/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/rutils
	dev-lisp/drakma
	dev-lisp/named-readtables
	dev-lisp/let-star
	dev-lisp/cl-ppcre
	dev-lisp/uiop
	dev-lisp/jonathan
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org
}
