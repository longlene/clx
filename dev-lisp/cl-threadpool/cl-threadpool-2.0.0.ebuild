# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="A thread pool written in Common Lisp"
HOMEPAGE="https://github.com/Frechmatz/cl-threadpool"
SRC_URI="https://github.com/Frechmatz/cl-threadpool/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/queues
	dev-lisp/verbose
	test? ( dev-lisp/lisp-unit )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd test
}
