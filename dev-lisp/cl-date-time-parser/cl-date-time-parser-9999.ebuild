# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Parse date-time-string, liberally"
HOMEPAGE="https://github.com/tkych/cl-date-time-parser"
SRC_URI=""

EGIT_REPO_URI="https://github.com/tkych/cl-date-time-parser.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/split-sequence
	dev-lisp/anaphora
	dev-lisp/cl-ppcre
	dev-lisp/local-time
	dev-lisp/parse-float
"
