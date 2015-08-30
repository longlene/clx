# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A Resque clone in Common Lisp"
HOMEPAGE="https://github.com/fukamachi/lesque"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/lesque.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-syntax
dev-lisp/cl-redis
dev-lisp/yason
dev-lisp/local-time
dev-lisp/trivial-backtrace
dev-lisp/log4cl
dev-lisp/alexandria
"

src_install() {
	common-lisp-install-sources -t all src README.markdown
	common-lisp-install-asdf lesque.asd lesque-worker.asd
	if use test ; then
		common-lisp-install-sources t
		common-lisp-install-asdf lesque-test.asd
	fi
}
