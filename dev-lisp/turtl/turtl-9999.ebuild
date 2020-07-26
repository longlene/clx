# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="An encrypted note/bookmark/data organizer"
HOMEPAGE="https://turtl.it"
SRC_URI=""

EGIT_REPO_URI="https://github.com/turtl/api.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/blackbird
	dev-lisp/cl-async
	dev-lisp/wookie
	dev-lisp/cl-rethinkdb
	dev-lisp/cl-hash-util
	dev-lisp/cl-ppcre
	dev-lisp/flexi-streams
	dev-lisp/cl-fad
	dev-lisp/jonathan
	dev-lisp/cl-mongo-id
	dev-lisp/cl-base64
	dev-lisp/drakma-async
	dev-lisp/local-time
	dev-lisp/ironclad
	dev-lisp/secure-random
	dev-lisp/bordeaux-threads
	dev-lisp/xmls
	dev-lisp/vom
"
