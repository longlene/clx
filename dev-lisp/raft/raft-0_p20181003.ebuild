# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="08921ac93f235595b2f0a344704ad2dad4e8ee1a"

DESCRIPTION="Common Lisp raft implementation"
HOMEPAGE="https://github.com/AeroNotix/raft"
SRC_URI="https://github.com/AeroNotix/raft/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/log4cl
	dev-lisp/flexi-streams
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
	dev-lisp/place-utils
	dev-lisp/usocket
	dev-lisp/usocket-server
	dev-lisp/chanl
	dev-lisp/trivial-timers
	dev-lisp/cl-store
	dev-lisp/uuid
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-tests.asd tests
}
