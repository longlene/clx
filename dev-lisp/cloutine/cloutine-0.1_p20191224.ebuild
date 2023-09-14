# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="10f66e8d9a316d1a787a74e71cb8d820e7068fc1"

DESCRIPTION="cloutine is a prototype of coroutine like goroutine"
HOMEPAGE="https://github.com/eshamster/cloutine"
SRC_URI="https://github.com/eshamster/cloutine/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/cl-cont
	dev-lisp/blackbird
	test? ( dev-lisp/rove )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem cloutine\/t/,$d' ${PN}.asd
		rm -r t
	fi
}
