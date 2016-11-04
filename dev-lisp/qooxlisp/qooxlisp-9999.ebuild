# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="The Last Web App Framework You Will Ever Evaluate: qooxdoo, Lisp, and Cells"
HOMEPAGE="https://github.com/kennytilton/qooxlisp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/kennytilton/qooxlisp.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/utils-kt
	dev-lisp/cells
	dev-lisp/cl-json
"

src_prepare() {
	eapply_user
	rm -rf cl-json_0.4.0 apropos ide
}
