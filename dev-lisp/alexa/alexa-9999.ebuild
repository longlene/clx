# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="A Lexical Analyzer Generator"
HOMEPAGE="https://github.com/rigetticomputing/alexa/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/rigetticomputing/alexa.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
"
