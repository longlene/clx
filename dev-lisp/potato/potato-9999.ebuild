# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Group chat application"
HOMEPAGE="https://github.com/cicakhq/potato"
SRC_URI=""

EGIT_REPO_URI="https://github.com/cicakhq/potato.git"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lofn
	dev-lisp/clouchdb
	dev-lisp/html5-notification
	dev-lisp/st-json
	dev-lisp/alexandria
	dev-lisp/local-time
	dev-lisp/trivial-utf8
	dev-lisp/ironclad
	dev-lisp/secure-random
	dev-lisp/closer-mop
	dev-lisp/string-case
	dev-lisp/cl-memcached
	dev-lisp/iolib
	dev-lisp/trivial-gray-streams
	dev-lisp/receptacle
	dev-lisp/cl-who
	dev-lisp/log4cl
	dev-lisp/cl-smtp
	dev-lisp/cl-conspack
	dev-lisp/cl-base64
	dev-lisp/hunchensocket
	dev-lisp/north
	dev-lisp/cl-markup
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-timers
	dev-lisp/cl-ppcre
	dev-lisp/queues
	dev-lisp/fset
	dev-lisp/trivial-ldap
	dev-lisp/cl-gss
	dev-lisp/cl-solr
	dev-lisp/trivial-backtrace
	dev-lisp/zs3
	dev-lisp/pooler
	dev-lisp/lparallel
	dev-lisp/cl-containers
	dev-lisp/cl-rabbit
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-tests.asd src/tests
}
