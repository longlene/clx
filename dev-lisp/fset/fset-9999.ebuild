# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="FSet, the functional collections library for Common Lisp"
HOMEPAGE="https://github.com/slburson/fset"
SRC_URI=""

EGIT_REPO_URI="https://github.com/slburson/fset.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/misc-extensions
	dev-lisp/mt19937
"
