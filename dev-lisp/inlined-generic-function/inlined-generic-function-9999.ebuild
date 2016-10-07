# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Bringing the speed of Static Dispatch to CLOS"
HOMEPAGE="https://github.com/guicho271828/inlined-generic-function"
SRC_URI=""

EGIT_REPO_URI="https://github.com/guicho271828/inlined-generic-function.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivia
	dev-lisp/closer-mop
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/introspect-environment
"
