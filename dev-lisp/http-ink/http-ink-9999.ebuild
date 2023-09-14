# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="http server"
HOMEPAGE="https://github.com/m0cchi/http-ink"
SRC_URI=""

EGIT_REPO_URI="https://github.com/m0cchi/http-ink.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/flexi-streams
	dev-lisp/cl-fad
	dev-lisp/local-time
	dev-lisp/trivial-mimes
	dev-lisp/split-sequence
"
