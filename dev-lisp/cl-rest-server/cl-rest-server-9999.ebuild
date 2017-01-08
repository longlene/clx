# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Serve REST APIs from Common Lisp"
HOMEPAGE="https://github.com/mmontone/cl-rest-server"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mmontone/cl-rest-server.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hunchentoot
	dev-lisp/alexandria
	dev-lisp/log5
	dev-lisp/cl-json
	dev-lisp/cxml
	dev-lisp/local-time
	dev-lisp/split-sequence
	dev-lisp/parse-number
	dev-lisp/string-case
	dev-lisp/drakma
	dev-lisp/cl-who
	dev-lisp/ironclad
	dev-lisp/babel
	dev-lisp/closer-mop
	dev-lisp/group-by
	dev-lisp/chronicity
	dev-lisp/net-telent-date
	dev-lisp/md5
	dev-lisp/cl-annot
	dev-lisp/dynamic-mixins
	dev-lisp/cl-oauth
	dev-lisp/trivial-mimes
	dev-lisp/access
	dev-lisp/trivial-shell
	test? ( dev-lisp/fiveam dev-lisp/cl-html5-parser )
"

src_prepare() {
	eapply_user
	use test || rm -rf rest-server-tests.asd test
}
