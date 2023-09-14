# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Web framework for Hunchentoot"
HOMEPAGE="https://github.com/lokedhs/lofn"
SRC_URI=""

EGIT_REPO_URI="https://github.com/lokedhs/lofn.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hunchentoot
	dev-lisp/alexandria
	dev-lisp/st-json
	dev-lisp/parse-number
	dev-lisp/cl-yacc
	dev-lisp/string-case
	dev-lisp/secure-random
	dev-lisp/receptacle
	dev-lisp/closer-mop
	dev-lisp/html5-notification
	dev-lisp/trivial-timers
	dev-lisp/log4cl
"
