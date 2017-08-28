# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b5add9f6ada4d8f68368c6965c3ddd81c85dcfc6"

DESCRIPTION="A Common Lisp library for interacting with PostgreSQL databases."
HOMEPAGE="http://marijnhaverbeke.nl/postmodern/"
SRC_URI="https://github.com/marijnh/Postmodern/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~sparc ~x86"
IUSE="test"

RDEPEND="
	dev-lisp/closer-mop
	dev-lisp/bordeaux-threads
	dev-lisp/md5
	dev-lisp/usocket
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -e '/defsystem\ :postmodern-tests/,$d' -i ${PN}.asd
		sed -e '/defsystem\ :cl-postgres-tests/,$d' -i cl-postgres.asd
		sed -e '/defsystem\ :simple-date-tests/,$d' -i simple-date.asd
	fi
}

