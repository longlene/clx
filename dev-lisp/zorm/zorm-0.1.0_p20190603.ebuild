# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a9a1367e2fafd7f2d2eccb84271b587b70ce669d"

DESCRIPTION="Common Lisp ORM for PostgreSQL"
HOMEPAGE="https://github.com/chaitanyagupta/zorm"
SRC_URI="https://github.com/chaitanyagupta/zorm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/postmodern
	dev-lisp/closer-mop
	dev-lisp/bordeaux-threads
	test? ( dev-lisp/test )
"

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "zorm\/test/,$d' ${PN}.asd
		rm zorm-test.lisp
	fi
}
BDEPEND=""
