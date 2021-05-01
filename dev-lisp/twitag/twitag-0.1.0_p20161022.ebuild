# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bb28785cec45b5ab3d312e6d7aab8498a724d601"

DESCRIPTION="Simple Twitter tagging bot"
HOMEPAGE="https://github.com/l04m33/twitag"
SRC_URI="https://github.com/l04m33/twitag/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-async
	dev-lisp/cl-async-twitter
	dev-lisp/blackbird
	dev-lisp/cl-sqlite
	dev-lisp/lparallel
	dev-lisp/vom
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd test
}
