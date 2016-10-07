# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="RP and chat server/client written in Common Lisp"
HOMEPAGE="https://github.com/phoe/gateway"
SRC_URI=""

EGIT_REPO_URI="https://github.com/phoe/gateway.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/closer-mop
	dev-lisp/ironclad
	dev-lisp/flexi-streams
	dev-lisp/local-time
	dev-lisp/lam
	dev-lisp/secure-read
	dev-lisp/bordeaux-threads
	dev-lisp/usocket
	dev-lisp/jpl-queues
	dev-lisp/trivial-arguments
	dev-lisp/trivia
"
