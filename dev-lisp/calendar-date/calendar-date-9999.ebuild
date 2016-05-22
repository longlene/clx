# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Gregorian calendar date library in Common Lisp"
HOMEPAGE="https://github.com/takagi/calendar-date"
SRC_URI=""

EGIT_REPO_URI="https://github.com/takagi/calendar-date.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/local-time
"

src_prepare() {
	use test || rm t ${PN}-test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
