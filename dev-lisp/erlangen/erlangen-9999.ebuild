# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Distributed, asychronous message passing system for Clozure Common Lisp"
HOMEPAGE="https://github.com/eugeneia/erlangen"
SRC_URI=""

EGIT_REPO_URI="https://github.com/eugeneia/erlangen.git"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivia
	dev-lisp/jpl-queues
	dev-lisp/trivial-utf8
	dev-lisp/fast-io
	dev-lisp/cl-conspack
	dev-lisp/split-sequence
"
