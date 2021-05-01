# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="A full-featured IRC bot in Common Lisp"
HOMEPAGE="https://github.com/dlowe-net/orcabot"
SRC_URI=""

EGIT_REPO_URI="https://github.com/dlowe-net/orcabot.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/chronicity
	dev-lisp/cl-plus-ssl
	dev-lisp/cl-csv
	dev-lisp/cl-json
	dev-lisp/cl-irc
	dev-lisp/cl-log
	dev-lisp/cl-ppcre
	dev-lisp/cxml
	dev-lisp/drakma
	dev-lisp/esrap
	dev-lisp/html-entities
	dev-lisp/local-time
	dev-lisp/iolib
	dev-lisp/parse-number
"
