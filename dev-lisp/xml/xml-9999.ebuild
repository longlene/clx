# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="An XML document parser for ClozureCL"
HOMEPAGE="https://github.com/massung/xml"
SRC_URI=""

EGIT_REPO_URI="https://github.com/massung/xml.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/parse
	dev-lisp/re
	dev-lisp/lexer
	dev-lisp/markup
"
