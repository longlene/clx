# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Markup encoding and decoding for Common Lisp"
HOMEPAGE="https://github.com/massung/markup"
SRC_URI=""

EGIT_REPO_URI="https://github.com/massung/markup.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/parse
	dev-lisp/lexer
	dev-lisp/re
"
# TODO need lexer
