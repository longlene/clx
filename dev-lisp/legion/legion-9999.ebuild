# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Simple multithreading worker mechanism"
HOMEPAGE="http://gamera.wikia.com/wiki/Legion"
SRC_URI=""

EGIT_REPO_URI="http://github.com/fukamachi/legion.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-speedy-queue
dev-lisp/bordeaux-threads
dev-lisp/vom
"

src_install() {
	common-lisp-install-sources -t all src README.markdown
	common-lisp-install-asdf legion.asd
	if use test; then
		common-lisp-install-sources t
		common-lisp-install-asdf legion-test.asd
	fi
}
