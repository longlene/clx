# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e310e8d69a6330fd5ed23db9094e9d44f5f96700"

DESCRIPTION="A Common Lisp implementation of the MessagePack-RPC specification"
HOMEPAGE="https://github.com/adolenc/cl-messagepack-rpc"
SRC_URI="https://github.com/adolenc/cl-messagepack-rpc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-messagepack
	dev-lisp/cl-async
	dev-lisp/cl-libuv
	dev-lisp/cffi
	dev-lisp/flexi-streams
	dev-lisp/trivial-backtrace
	dev-lisp/alexandria
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-tests.asd t
}
