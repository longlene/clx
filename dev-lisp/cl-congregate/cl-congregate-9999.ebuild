# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="A service and protocol for coordinating recurring get-togethers between many humans"
HOMEPAGE="https://github.com/inaimathi/cl-congregate"
SRC_URI=""

EGIT_REPO_URI="https://github.com/inaimathi/cl-congregate.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/house
	dev-lisp/drakma
	dev-lisp/fact-base
	dev-lisp/yason
	dev-lisp/cl-who
	dev-lisp/cl-css
	dev-lisp/parenscript
	dev-lisp/local-time
	dev-lisp/split-sequence
	dev-lisp/cl-ppcre
"
