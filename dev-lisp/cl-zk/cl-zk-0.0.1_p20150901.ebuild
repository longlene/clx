# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="30a72510718ee1d67c7760de96423af2e4ec3024"

DESCRIPTION="Common Lisp Zookeeper client"
HOMEPAGE="https://github.com/AeroNotix/cl-zk"
SRC_URI="https://github.com/AeroNotix/cl-zk/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AL2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/flexi-streams
	dev-lisp/split-sequence
	dev-lisp/bordeaux-threads
	dev-lisp/uuid
	dev-lisp/usocket
	dev-lisp/chanl
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem\ :cl-zk-test/,$d' cl-zk.asd
		rm -r test
	fi
}
