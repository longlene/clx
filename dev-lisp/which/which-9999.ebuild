# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="The which command in Comman Lisp"
HOMEPAGE="https://github.com/eudoxia0/which"
SRC_URI=""

EGIT_REPO_URI="https://github.com/eudoxia0/which.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-fad
	dev-lisp/path-parse
"

src_prepare() {
	use test || rm -r t which-test.asd
}
