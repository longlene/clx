# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="NREPL server for Common Lisp"
HOMEPAGE="https://github.com/sjl/cl-nrepl"
SRC_URI=""

EGIT_REPO_URI="https://github.com/sjl/cl-nrepl.git"

LICENSE="EPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bencode
	dev-lisp/bordeaux-threads
	dev-lisp/dissect
	dev-lisp/flexi-streams
	dev-lisp/fset
	dev-lisp/split-sequence
	dev-lisp/trivial-arguments
	dev-lisp/usocket
	dev-lisp/uuid
"
