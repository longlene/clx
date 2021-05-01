# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Quickutil is a new way of thinking about utilities"
HOMEPAGE="http://quickutil.org/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/tarballs-are-good/quickutil.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-heredoc
	dev-lisp/ningle
	dev-lisp/clack-middleware-csrf
	dev-lisp/cl-syntax
	dev-lisp/cl-ppcre
	dev-lisp/yason
	dev-lisp/closure-template
	dev-lisp/cl-fad
	dev-lisp/cl-markdown
	dev-lisp/cl-dbi
	dev-lisp/multival-plist
	dev-lisp/trivial-shell
	"

src_prepare() {
	eapply_user
	use test || rm -rf quickutil-utilities/{test.lisp,test-utilities.lisp,utilities,quickutil-utilities-test.asd}
}
