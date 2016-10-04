# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="a REPL implementation"
HOMEPAGE="https://github.com/bluelisp/prepl"
SRC_URI=""

EGIT_REPO_URI="https://github.com/bluelisp/prepl.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/iterate
	dev-lisp/bordeaux-threads
	dev-lisp/conium
	dev-lisp/named-readtables
"
