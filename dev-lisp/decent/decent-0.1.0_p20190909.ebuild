# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b0e23254aca194c2b42ac998e8ee7f2947f6bd80"

DESCRIPTION="A small http web server"
HOMEPAGE="https://github.com/mateuszb/decent"
SRC_URI="https://github.com/mateuszb/decent/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/socket
	dev-lisp/reactor
	dev-lisp/string-case
	dev-lisp/cl-ppcre
	dev-lisp/quri
	dev-lisp/tls
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "decent\/test/,$d' ${PN}.asd
		rm -r tests
	fi
}
