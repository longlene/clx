# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A metaclass for bridging CLOS and JSON objects"
HOMEPAGE="https://github.com/gschjetne/json-mop/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/gschjetne/json-mop.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/yason
	dev-lisp/anaphora
"

src_prepare() {
	rm -rf tests
}
