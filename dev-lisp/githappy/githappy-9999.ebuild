# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Query the github REST API"
HOMEPAGE="https://github.com/xach/githappy"
SRC_URI=""

EGIT_REPO_URI="https://github.com/xach/githappy.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/drakma
	dev-lisp/trivial-utf8
	dev-lisp/yason
"
