# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Fork of CXML"
HOMEPAGE="https://github.com/TBRSS/FXML"
SRC_URI=""

EGIT_REPO_URI="https://github.com/TBRSS/FXML.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/babel
	dev-lisp/named-readtables
	dev-lisp/trivial-gray-streams
	dev-lisp/quri
	dev-lisp/flexi-streams
	dev-lisp/alexandria
	dev-lisp/serapeum
	dev-lisp/split-sequence
	dev-lisp/uiop
	dev-lisp/cxml
	dev-lisp/fset
	dev-lisp/cl-html5-parser
"
