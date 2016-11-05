# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="A universal document converter"
HOMEPAGE="https://github.com/CommonDoc/pandocl"
SRC_URI=""

EGIT_REPO_URI="https://github.com/CommonDoc/pandocl.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/common-doc
	dev-lisp/vertex
	dev-lisp/scriba
	dev-lisp/parenml
	dev-lisp/thorn
	dev-lisp/common-html
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
