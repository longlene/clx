# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f7ba49f1ec01fb99a7aeb8f18e245a44411c361b"

DESCRIPTION="Distribute work across machines using the lparallel API"
HOMEPAGE="https://github.com/lmj/lfarm"
SRC_URI="https://github.com/lmj/lfarm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
	dev-lisp/cl-gss
	dev-lisp/cl-plus-ssl
	dev-lisp/cl-store
	dev-lisp/external-program
	dev-lisp/flexi-streams
	dev-lisp/lparallel
	dev-lisp/trivial-gray-streams
	dev-lisp/usocket
"

src_prepare() {
	use test || rm -r ${PN}-test.asd ${PN}-test
}
