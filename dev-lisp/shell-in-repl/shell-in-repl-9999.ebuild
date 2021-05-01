# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit git-r3 common-lisp-3

DESCRIPTION="A trivial read-macro for uiop:run-program"
HOMEPAGE="https://github.com/tkych/shell-in-repl"
SRC_URI=""

EGIT_REPO_URI="https://github.com/tkych/shell-in-repl.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/named-readtables
	dev-lisp/uiop
"
