# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A compact, extendable eventing fabric"
HOMEPAGE="https://github.com/orthecreedence/event-glue"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/event-glue.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	use test || rm -rf ${PN}-test.asd test
}
