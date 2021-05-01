# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="53bbc4c87716047131fd2afa53111114cabb5a63"

DESCRIPTION="Client wrapper library for the HipChat API"
HOMEPAGE="https://github.com/tormaroe/cl-hipchat"
SRC_URI="https://github.com/tormaroe/cl-hipchat/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/drakma
	dev-lisp/cl-json
	dev-lisp/do-urlencode
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}
