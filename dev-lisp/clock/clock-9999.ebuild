# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="A Common Lisp date/time library"
HOMEPAGE="https://github.com/dlowe-net/clock"
SRC_URI=""

EGIT_REPO_URI="https://github.com/dlowe-net/clock.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
test? ( dev-lisp/stefil )
"

src_prepare() {
	use test || rm -rf ${PN}.test.asd test
}
