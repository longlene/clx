# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="525a8aedfce43a9e674df1b0d1da077b83025447"

DESCRIPTION="Wrapped Twitter APIs for Common Lisp and cl-async"
HOMEPAGE="https://github.com/l04m33/cl-async-twitter"
SRC_URI="https://github.com/l04m33/cl-async-twitter/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-async
	dev-lisp/cl-async-oauth
	dev-lisp/blackbird
	dev-lisp/babel
	dev-lisp/cl-json
	dev-lisp/vom
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd test
}
