# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="af221ae691e62f03af13d5b557448fa3bbd91be6"

DESCRIPTION="SSDB client for Common Lisp"
HOMEPAGE="https://github.com/muyinliu/cl-ssdb"
SRC_URI="https://github.com/muyinliu/cl-ssdb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/rutils
	dev-lisp/cl-ppcre
	dev-lisp/usocket
	dev-lisp/flexi-streams
	dev-lisp/parse-number
	dev-lisp/babel
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd test
}
