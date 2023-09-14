# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="A non-blocking stream parser library for Common Lisp"
HOMEPAGE="https://github.com/inaimathi/cl-lazy-parse"
SRC_URI=""

EGIT_REPO_URI="https://github.com/inaimathi/cl-lazy-parse.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/flexi-streams
	dev-lisp/usocket
"
