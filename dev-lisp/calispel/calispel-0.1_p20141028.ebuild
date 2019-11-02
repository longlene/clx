# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e9f2f9c1af97f4d7bb4c8ac25fb2a8f3e8fada7a"

DESCRIPTION="CSP-like channels for common lisp"
HOMEPAGE="https://github.com/hawkir/calispel"
SRC_URI="https://github.com/hawkir/calispel/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/jpl-queues
	dev-lisp/bordeaux-threads
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "calispel-test/,$d' ${PN}.asd
		rm test.lisp
	fi
}
