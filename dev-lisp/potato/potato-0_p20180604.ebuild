# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="88b6c92dbbc80a6c9552435604f7b1ae6f2a4026"

DESCRIPTION="Delicious conversations platform in Common Lisp and ClojureScript"
HOMEPAGE="https://github.com/cicakhq/potato"
SRC_URI="https://github.com/cicakhq/potato/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
	dev-lisp/clouchdb
	dev-lisp/log4cl
	dev-lisp/trivial-backtrace
	dev-lisp/string-case
	dev-lisp/uiop
	dev-lisp/zs3
	dev-lisp/secure-random
	dev-lisp/pooler
	dev-lisp/lparallel
	dev-lisp/fset
	dev-lisp/cl-containers
	dev-lisp/cl-solr
	dev-lisp/cl-rabbit
	dev-lisp/cl-rabbit-async
	dev-lisp/receptacle
	dev-lisp/cl-markup
	dev-lisp/cl-base64
	dev-lisp/trivial-ldap
	dev-lisp/cl-gss
	dev-lisp/lofn
	dev-lisp/html5-notification
	dev-lisp/st-json
	dev-lisp/local-time
	dev-lisp/trivial-utf8
	dev-lisp/ironclad
	dev-lisp/closer-mop
	dev-lisp/cl-memcached
	dev-lisp/iolib
	dev-lisp/trivial-gray-streams
	dev-lisp/cl-who
	dev-lisp/cl-smtp
	dev-lisp/cl-conspack
	dev-lisp/hunchensocket
	dev-lisp/north
	dev-lisp/trivial-timers
	dev-lisp/cl-ppcre
	dev-lisp/queues
	dev-lisp/fset
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-tests.asd src/tests
}
