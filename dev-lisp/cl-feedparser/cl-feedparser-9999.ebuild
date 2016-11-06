# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp feed parser"
HOMEPAGE="https://github.com/TBRSS/cl-feedparser"
SRC_URI=""

EGIT_REPO_URI="https://github.com/TBRSS/cl-feedparser.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
